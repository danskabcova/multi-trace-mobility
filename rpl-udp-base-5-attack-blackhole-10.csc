<?xml version="1.0" encoding="UTF-8"?>
<simconf>
  <simulation>
    <title>STACK RPL-UDP-IDS Example Random Attack</title>
    <randomseed>123457</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      org.contikios.cooja.radiomediums.UDGM
      <transmitting_range>50.0</transmitting_range>
      <interference_range>100.0</interference_range>
      <success_ratio_tx>1.0</success_ratio_tx>
      <success_ratio_rx>1.0</success_ratio_rx>
    </radiomedium>
    <events>
      <logoutput>40000</logoutput>
      <datatrace>true</datatrace>
    </events>
    <motetype>
      org.contikios.cooja.contikimote.ContikiMoteType
      <identifier>mtype700277195</identifier>
      <description>Cooja Mote Type #1</description>
      <source>[CONFIG_DIR]/../udp-server.c</source>
      <commands>make -j$(CPUS) udp-server.cooja TARGET=cooja</commands>
      <moteinterface>org.contikios.cooja.interfaces.Position</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.Battery</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiVib</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiMoteID</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRS232</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiBeeper</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiIPAddress</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRadio</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiButton</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiPIR</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiClock</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiLED</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.MoteAttributes</moteinterface>
    </motetype>
    <motetype>
      org.contikios.cooja.contikimote.ContikiMoteType
      <identifier>mtype506906404</identifier>
      <description>Cooja Mote Type #2</description>
      <source>[CONFIG_DIR]/../udp-client.c</source>
      <commands>make -j$(CPUS) udp-client.cooja TARGET=cooja</commands>
      <moteinterface>org.contikios.cooja.interfaces.Position</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.Battery</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiVib</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiMoteID</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRS232</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiBeeper</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiIPAddress</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRadio</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiButton</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiPIR</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiClock</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiLED</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.MoteAttributes</moteinterface>
    </motetype>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>43.291897546941804</x>
        <y>7.17470867058031</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>1</id>
      </interface_config>
      <motetype_identifier>mtype700277195</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>41.0074953544532</x>
        <y>42.15996473110367</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>2</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>62.14716228260997</x>
        <y>33.4762563475895</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>3</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>78.68328749367092</x>
        <y>20.503560912261698</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>4</id>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiRS232
        <history>asdf~;</history>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>93.05570620505483</x>
        <y>4.903395862706303</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>5</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>64.7691549635065</x>
        <y>65.98247687038179</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>6</id>
  </simulation>
  <plugin>
    org.contikios.cooja.plugins.SimControl
    <width>302</width>
    <z>2</z>
    <height>157</height>
    <location_x>3</location_x>
    <location_y>0</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.Visualizer
    <plugin_config>
      <moterelations>true</moterelations>
      <skin>org.contikios.cooja.plugins.skins.IDVisualizerSkin</skin>
      <skin>org.contikios.cooja.plugins.skins.UDGMVisualizerSkin</skin>
      <skin>org.contikios.cooja.plugins.skins.MoteTypeVisualizerSkin</skin>
      <viewport>1.68758401899377 0.0 0.0 1.68758401899377 -43.185404471347574 22.822079273955353</viewport>
    </plugin_config>
    <width>306</width>
    <z>4</z>
    <height>328</height>
    <location_x>3</location_x>
    <location_y>158</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.LogListener
    <plugin_config>
      <filter>App</filter>
      <formatted_time />
      <coloring />
    </plugin_config>
    <width>519</width>
    <z>1</z>
    <height>487</height>
    <location_x>304</location_x>
    <location_y>-1</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.RadioLogger
    <plugin_config>
      <split>260</split>
      <formatted_time />
      <analyzers name="6lowpan" />
    </plugin_config>
    <width>500</width>
    <z>3</z>
    <height>488</height>
    <location_x>823</location_x>
    <location_y>-2</location_y>
  </plugin>
  <plugin>
    org.contikios.cooja.plugins.ScriptRunner
    <plugin_config>
      <script>success = false;
var senders = {};
var waiting_for_stable_network = true;
// Number of clients (the sink excluded)
var clients = sim.getMotesCount() - 1;
var msgrecv = /.+INFO: App.+Received +message.+ from ([0-9a-f:]+).*/;
var r = new java.util.Random(sim.getRandomSeed());
var attackerId = 2 + r.nextInt(clients);

TIMEOUT(3600000, if(success) { log.testOK(); }); /* milliseconds. print last msg at timeout */

while(waiting_for_stable_network) {
    YIELD();
    if (id == 1) {
        match = msg.match(msgrecv)
        if (match) {
            senders[match[1]] = true;
            var size = Object.keys(senders).length;
            log.log("sink has contact with " + match[1] + " (" + (clients - size) + " remaining)\n");
            if (size &gt;= clients) {
                log.log("contact with all clients!\n");
                waiting_for_stable_network = false;
            }
        }
    }
}

GENERATE_MSG(2000, "continue");
YIELD_THEN_WAIT_UNTIL(msg.equals("continue"));

sim.getEventCentral().logEvent("network", "steady-state");
log.log("network steady state!\n");

GENERATE_MSG(5000, "continue");
YIELD_THEN_WAIT_UNTIL(msg.equals("continue"));

var attacker = sim.getMoteWithID(attackerId);
log.log("network blackkhole attack from " + attacker.getID() + "!\n");
sim.getEventCentral().logEvent("attack", "blackhole:" + attacker.getID());
write(attacker, "attack");

success = true;

GENERATE_MSG(3600000, "continue");
YIELD_THEN_WAIT_UNTIL(msg.equals("continue"));

log.testOK();</script>
      <active>true</active>
    </plugin_config>
    <width>600</width>
    <z>0</z>
    <height>642</height>
    <location_x>902</location_x>
    <location_y>53</location_y>
  </plugin>
</simconf>

