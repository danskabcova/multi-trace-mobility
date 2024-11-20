<?xml version='1.0' encoding='utf-8'?>
<simconf>
  <project EXPORT="discard">[APPS_DIR]/mobility</project>
  <simulation>
    <title>STACK RPL-UDP-IDS Example Random Attack</title>
    <randomseed>2010642585</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      org.contikios.cooja.radiomediums.UDGM
      <transmitting_range>200.0</transmitting_range>
      <interference_range>300.0</interference_range>
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
        <x>65.8154501134652</x>
        <y>45.316330125136986</y>
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
        <x>59.55899030993771</x>
        <y>93.48901140262409</y>
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
        <x>39.10205190437392</x>
        <y>74.55849165464399</y>
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
        <x>24.198757653922087</x>
        <y>112.39824473894329</y>
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
        <x>24.575909325801945</x>
        <y>22.127498660936965</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>6</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>66.19158667831454</x>
        <y>78.28473215782623</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>7</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>42.85359748403738</x>
        <y>53.91982682192252</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>8</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>76.09749295039154</x>
        <y>99.06927444533409</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>9</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>-13.250524857210564</x>
        <y>33.23805347809828</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>10</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>-19.132054253765318</x>
        <y>134.45303402690183</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>11</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>100.17715015986369</x>
        <y>138.60615153592587</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>12</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>-6.7432468653106525</x>
        <y>99.15406403546609</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>13</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>126.42115865540802</x>
        <y>139.97947006830637</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>14</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>-22.290769174067407</x>
        <y>12.648378974824293</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>15</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
    <mote>
      <interface_config>
        org.contikios.cooja.interfaces.Position
        <x>-11.052110562396479</x>
        <y>181.2173122613604</y>
        <z>0.0</z>
      </interface_config>
      <interface_config>
        org.contikios.cooja.contikimote.interfaces.ContikiMoteID
        <id>16</id>
      </interface_config>
      <motetype_identifier>mtype506906404</motetype_identifier>
    </mote>
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
    Mobility
    <plugin_config>
      <positions EXPORT="copy">[APPS_DIR]/mobility/positions.dat</positions>
    </plugin_config>
    <width>500</width>
    <z>1</z>
    <height>200</height>
    <location_x>520</location_x>
    <location_y>542</location_y>
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

TIMEOUT(4000000, if(success) { log.testOK(); }); /* milliseconds. print last msg at timeout */

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

GENERATE_MSG(50000, "continue");
YIELD_THEN_WAIT_UNTIL(msg.equals("continue"));

var attacker = sim.getMoteWithID(attackerId);
log.log("network blackkhole attack from " + attacker.getID() + "!\n");
sim.getEventCentral().logEvent("attack", "blackhole:" + attacker.getID());
write(attacker, "attack");
write(attacker, "enable_spoofing");

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
