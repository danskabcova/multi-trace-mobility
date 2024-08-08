package org.contikios.cooja.plugins;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;

import javax.swing.JFileChooser;
import javax.swing.JScrollPane;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.jdom.Element;

import org.contikios.cooja.ClassDescription;
import org.contikios.cooja.Cooja;
import org.contikios.cooja.Mote;
import org.contikios.cooja.PluginType;
import org.contikios.cooja.Simulation;
import org.contikios.cooja.TimeEvent;
import org.contikios.cooja.VisPlugin;
import org.contikios.cooja.dialogs.MessageListUI;
import org.contikios.cooja.interfaces.Position;
import org.contikios.cooja.util.StringUtils;

@ClassDescription("Mobility")
@PluginType(PluginType.SIM_PLUGIN)
public class Mobility extends VisPlugin {
  private static final long serialVersionUID = -1087396096570660083L;
  private static Logger logger = LogManager.getLogger(Mobility.class);

  private static final boolean QUIET = false;

  private final boolean WRAP_MOVES = true; /* Wrap around loaded moves forever */
  
  private Move[] entries; /* All mote moves */
  private Simulation simulation;
  private long periodStart; /* us */
  private int currentMove;

  private File filePositions = null;

  private MessageListUI log = new MessageListUI();

  public Mobility(Simulation simulation, final Cooja gui) {
    super("Mobility", gui);
    this.simulation = simulation;

    log.addPopupMenuItem(null, true); /* Create message list popup */
    add(new JScrollPane(log));

    if (!QUIET) {
      log.addMessage("Mobility plugin started at (ms): " + simulation.getSimulationTimeMillis());
      logger.info("Mobility plugin started at (ms): " + simulation.getSimulationTimeMillis());
    }
    setSize(500,200);
  }

  public void startPlugin() {
    super.startPlugin();

    if (filePositions != null) {
      /* Positions were already loaded */
      return;
    }

    if (!Cooja.isVisualized()) {
      // Headless mode: load positions.dat file directly
      filePositions = new File("positions.dat"); // Specify the correct path here if different
      if (!filePositions.exists()) {
        throw new RuntimeException("positions.dat file not found in headless mode.");
      }
      loadPositions();
    } else {
      // GUI mode: use JFileChooser for file selection
      JFileChooser fileChooser = new JFileChooser();
      File suggest = new File(Cooja.getExternalToolsSetting("MOBILITY_LAST", "positions.dat"));
      fileChooser.setSelectedFile(suggest);
      fileChooser.setDialogTitle("Select positions file");
      int reply = fileChooser.showOpenDialog(Cooja.getTopParentContainer());
      if (reply == JFileChooser.APPROVE_OPTION) {
        filePositions = fileChooser.getSelectedFile();
        Cooja.setExternalToolsSetting("MOBILITY_LAST", filePositions.getAbsolutePath());
      }
      if (filePositions == null) {
        throw new RuntimeException("No positions file selected.");
      }
      loadPositions();
    }
  }
  
  private void loadPositions() {
    try {
      if (!QUIET) {
        log.addMessage("Parsing position file: " + filePositions);
        logger.info("Parsing position file: " + filePositions);
      }
  
      String data = StringUtils.loadFromFile(filePositions);
      
      /* Load move by move */
      ArrayList<Move> entriesList = new ArrayList<>();
      for (String line: data.split("\n")) {
        if (line.trim().isEmpty() || line.startsWith("#")) {
          /* Skip header/metadata */
          continue;
        }

        String[] args = line.split(" ");
        Move e = new Move();
        e.moteIndex = Integer.parseInt(args[0]); /* XXX Mote index. Not ID */
        e.time = (long) (Double.parseDouble(args[1])*1000.0*Simulation.MILLISECOND); /* s -> us */
        e.posX = Double.parseDouble(args[2]);
        e.posY = Double.parseDouble(args[3]);

        entriesList.add(e);
      }
      entries = entriesList.toArray(new Move[0]);
      if (!QUIET) {
        log.addMessage("Loaded " + entries.length + " positions");
        logger.info("Loaded " + entries.length + " positions");
      }

      setTitle("Mobility: " + filePositions.getName());
      
      /* Execute first event - it will reschedule itself */
      simulation.invokeSimulationThread(new Runnable() {
        public void run() {
          currentMove = 0;
          periodStart = simulation.getSimulationTime();
          moveNextMoteEvent.execute(Mobility.this.simulation.getSimulationTime());
        }
      });

    } catch (Exception e) {
      log.addMessage("Error when loading positions: " + e.getMessage());
      logger.info("Error when loading positions:", e);
      entries = new Move[0];
    }
  }

  private TimeEvent moveNextMoteEvent = new TimeEvent() {
    public void execute(long t) {

      /* Detect early events: reschedule for later */
      if (simulation.getSimulationTime() < entries[currentMove].time + periodStart) {
        simulation.scheduleEvent(this, entries[currentMove].time + periodStart);
        return;
      }

      /* Perform a single move */
      Move move = entries[currentMove];
      if (move.moteIndex < simulation.getMotesCount()) {
        Mote mote = simulation.getMote(move.moteIndex);
        Position pos = mote.getInterfaces().getPosition();
        pos.setCoordinates(move.posX, move.posY, pos.getZCoordinate());
      }

      currentMove++;
      if (currentMove >= entries.length) {
        if (!WRAP_MOVES) {
          return;
        }
        periodStart = simulation.getSimulationTime();
        currentMove = 0;
      }

      /* Reschedule future events */
      simulation.scheduleEvent(this, entries[currentMove].time + periodStart);
    }
  };

  public void closePlugin() {
    moveNextMoteEvent.remove();
  }

  class Move {
    long time;
    int moteIndex;
    double posX, posY;

    public String toString() {
      return "MOVE: mote " + moteIndex + " -> [" + posX + "," + posY + "] @ " + time/Simulation.MILLISECOND;
    }
  }
  
  public Collection<Element> getConfigXML() {
    ArrayList<Element> config = new ArrayList<>();
    Element element;

    if (filePositions != null) {
      element = new Element("positions");
      File file = simulation.getCooja().createPortablePath(filePositions);
      element.setText(file.getPath().replaceAll("\\\\", "/"));
      element.setAttribute("EXPORT", "copy");
      config.add(element);
    }

    return config;
  }
  
  public boolean setConfigXML(Collection<Element> configXML, boolean visAvailable) {
    for (Element element : configXML) {
      String name = element.getName();

      if (name.equals("positions")) {
        filePositions = simulation.getCooja().restorePortablePath(new File(element.getText()));
        loadPositions();
      }
    }

    return true;
  }
}
