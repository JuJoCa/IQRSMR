#!/usr/bin/python

import sys
import struct
import socket
import os
import time
import json
import re

from mininet.net import Mininet
from mininet.log import setLogLevel, info
from mininet.cli import CLI
from mininet.node import RemoteController
from mininet.node import Controller, OVSSwitch
from mininet.link import TCLink

def ipToLong (ip):
    """
    Convert an IP string into the long numeric value.
    """
    packedIP = socket.inet_aton(ip)
    return struct.unpack("!L", packedIP)[0]

def set_OFP_protocol(sws):
    for sw in sws:
        cmd = "sudo ovs-vsctl set bridge %s protocols=OpenFlow13" % sw
        os.system(cmd)

def numToIp (num):
    """
    Convert a numeric value into the IP string form.
    """
    num = int(num)
    return socket.inet_ntoa(struct.pack('!L', num)) 

def numToMac (num):
    """
    Convert a numeric value into the MAC string form.
    """
    number_In = num
    num = int(num)
    num = struct.pack('!Q', num)
    assert len(num) == 8
    
    if number_In < 10:
        r = ":".join(['%02x' % (i,) for i in num[2:]])
    else:
        r = "00:00:00:00:00:{0}".format(number_In)

    return r

def getFoldersNames(path_scripts):
    scriptFolders = os.listdir(path_scripts)
    return scriptFolders

def trafficGen_iperf (hosts_,tm):
    path_scripts = '/home/mininet18/mininet/scripts_iperf/'
    foldersNames = sorted(getFoldersNames(path_scripts))
    num_folders = len(foldersNames)
    tms = tm.split(',')

    for tm in range(num_folders):
        print('***'+foldersNames[tm]+'***')
        print( "*** 1. Launching servers ***" )
        start = time.time()
        cont = 0
        for server in hosts_:
            cont += 1
            if cont > 9: 
                print('Executing: \n{2}.cmd( "sudo bash {3}{0}/Servers/server_{1}.sh")'.format(foldersNames[tm],cont,server,path_scripts))
                server.cmd('sudo bash {2}{0}/Servers/server_{1}.sh &'.format(foldersNames[tm],cont,path_scripts))
            else:
                print('Executing: \n{2}.cmd( "sudo bash {3}{0}/Servers/server_0{1}.sh")'.format(foldersNames[tm],cont,server,path_scripts))
                server.cmd('sudo bash {2}{0}/Servers/server_0{1}.sh &'.format(foldersNames[tm],cont,path_scripts))
            time.sleep(6)
        	
        print( "*** 2. Launching clients ***")    
        cont = 0
        for client in hosts_:
            cont += 1
            if cont > 9:
                print('Executing: \n{2}.cmd("sudo bash {3}{0}/Clients/client_{1}.sh")'.format(foldersNames[tm],cont,client,path_scripts))
                client.cmd('sudo bash {2}{0}/Clients/client_{1}.sh &'.format(foldersNames[tm],cont,path_scripts))

            else:
                print('Executing: \n{2}.cmd("sudo bash {3}{0}/Clients/client_0{1}.sh")'.format(foldersNames[tm],cont,client,path_scripts))
                client.cmd('sudo bash {2}{0}/Clients/client_0{1}.sh &'.format(foldersNames[tm],cont,path_scripts))
            time.sleep(6)

        print("Wait while ends")
        time.sleep(30)
        end = time.time()
        duration = end-start
        print("{0} ended in: {1}s".format(foldersNames[tm],duration))

def createDataJSON(data):
	num_packets = 0
	num_packets_loss = 0
	bits_per_second = 0
	delay = 0
	i = 0

	for elem in data:
		num_packets += data[i]["end"]["sum"]["packets"]
		num_packets_loss += data[i]["end"]["sum"]["lost_packets"]
		bits_per_second += data[i]["end"]["sum"]["bits_per_second"]
		delay += data[i]["end"]["sum"]["jitter_ms"]
		i+=1
	print('packets: {0}\nlost_packets: {1}\nbits_per_second: {2}\ndelay:{3}\n'.format(num_packets/i,num_packets_loss/i,bits_per_second/i,delay/i))
	#se guarda en formato json los valores promedio de los datos	
	return dict([('packets', num_packets/i), ('lost_packets', num_packets_loss/i), ('bits_per_second', bits_per_second/i), ('delay', delay/i)])	

def multiController(controllerIp1, controllerIp2, controllerPort1, controllerPort2, trafficFlag_iperf, trafficFlag_ditg, ping, ac, tm):
    net = Mininet(controller=Controller, switch=OVSSwitch, link=TCLink, waitConnected=True)

    info("Creando Controladores\n")
    c0 = RemoteController("c0", ip=controllerIp1, port=controllerPort1)
    c1 = RemoteController("c1", ip=controllerIp2, port=controllerPort2)

    info("Creando Switches\n")
    s1 = net.addSwitch( 's1' )
    s2 = net.addSwitch( 's2' )
    s3 = net.addSwitch( 's3' )
    s4 = net.addSwitch( 's4' )
    s5 = net.addSwitch( 's5' )
    s6 = net.addSwitch( 's6' )
    s7 = net.addSwitch( 's7' )
    s8 = net.addSwitch( 's8' )
    s9 = net.addSwitch( 's9' )
    s10 = net.addSwitch( 's10' )
    s11 = net.addSwitch( 's11' )
    s12 = net.addSwitch( 's12' )
    s13 = net.addSwitch( 's13' )
    s14 = net.addSwitch( 's14' )
    s15 = net.addSwitch( 's15' )
    s16 = net.addSwitch( 's16' )
    s17 = net.addSwitch( 's17' )
    s18 = net.addSwitch( 's18' )
    s19 = net.addSwitch( 's19' )
    s20 = net.addSwitch( 's20' )
    s21 = net.addSwitch( 's21' )
    s22 = net.addSwitch( 's22' )
    s23 = net.addSwitch( 's23' )

    info("Creando Hosts\n")
    h1 = net.addHost( 'h1' )
    h2 = net.addHost( 'h2' )
    h3 = net.addHost( 'h3' )
    h4 = net.addHost( 'h4' )
    h5 = net.addHost( 'h5' )
    h6 = net.addHost( 'h6' )
    h7 = net.addHost( 'h7' )
    h8 = net.addHost( 'h8' )
    h9 = net.addHost( 'h9' )
    h10 = net.addHost( 'h10' )
    h11 = net.addHost( 'h11' )
    h12 = net.addHost( 'h12' )
    h13 = net.addHost( 'h13' )
    h14 = net.addHost( 'h14' )
    h15 = net.addHost( 'h15' )
    h16 = net.addHost( 'h16' )
    h17 = net.addHost( 'h17' )
    h18 = net.addHost( 'h18' )
    h19 = net.addHost( 'h19' )
    h20 = net.addHost( 'h20' )
    h21 = net.addHost( 'h21' )
    h22 = net.addHost( 'h22' )
    h23 = net.addHost( 'h23' )

    info("Creando Links\n")
    net.addLink(s1, h1)
    net.addLink(s2, h2)
    net.addLink(s3, h3)
    net.addLink(s4, h4)
    net.addLink(s5, h5)
    net.addLink(s6, h6)
    net.addLink( s7 , h7)
    net.addLink( s8 , h8)
    net.addLink( s9 , h9)
    net.addLink( s10 , h10)
    net.addLink( s11 , h11)
    net.addLink( s12 , h12)
    net.addLink( s13 , h13)
    net.addLink( s14 , h14)
    net.addLink( s15 , h15)
    net.addLink( s16 , h16)
    net.addLink( s17 , h17)
    net.addLink( s18 , h18)
    net.addLink( s19 , h19)
    net.addLink( s20 , h20)
    net.addLink( s21 , h21)
    net.addLink( s22 , h22)
    net.addLink( s23 , h23)

    info("Creando Links SW\n")
    
    net.addLink( s18 , s22, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s17 , s22, delay='1ms', bw=20)#, loss=1)
    net.addLink( s3 , s7, delay='1ms', bw=20)#, loss=1)
    net.addLink( s5 , s10, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s20 , s23, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s14 , s15, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s5 , s8, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s6 , s10, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s15 , s16, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s3 , s11, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s7 , s6, delay='1ms', bw=20)#, loss=1)
    net.addLink( s2 , s6, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s4 , s10, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s19 , s18, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s21 , s20, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s1 , s5, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s3 , s1, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s8 , s6, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s1 , s20)#, loss=1) ------
    net.addLink( s16 , s17, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s2 , s9, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s4 , s5, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s21 , s14, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s13 , s21, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s2 , s12, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s5 , s11, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s19 , s20, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s5 , s2, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s8 , s12, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s11 , s9, delay='1ms', bw=50.0)#, loss=1)
    net.addLink( s21 , s16, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s23 , s22, delay='1ms', bw=100.0)#, loss=1)
    net.addLink( s17 , s13, delay='1ms', bw=100.0)#, loss=1)

    # Customize IP and MAC for hosts
    info("Customizing IP and MAC for hosts\n")
    initialIp = ipToLong("10.0.0.0")

    for h in range(1, 24):
        host = net.get("h%s" % h)
        host.setIP("%s/16" % numToIp(h + initialIp))
        host.setMAC(numToMac(h))

    info("Comienza a funcionar la red\n")
    net.build()
   
    info("*** Controllers\n")
    c0.start()
    c1.start()

    info("*** Switches\n")
    s1.start([ c0 ])
    s13.start([ c1 ])
    s2.start([ c0 ])
    s14.start([ c1 ])
    s3.start([ c0 ])
    s15.start([ c1 ])
    s4.start([ c0 ])
    s16.start([ c1 ])
    s5.start([ c0 ])
    s17.start([ c1 ])
    s6.start([ c0 ])
    s18.start([ c1 ])
    s7.start([ c0 ])
    s19.start([ c1 ])
    s8.start([ c0 ])
    s20.start([ c1 ])
    s9.start([ c0 ])
    s21.start([ c1 ])
    s10.start([ c0 ])
    s22.start([ c1 ])
    s11.start([ c0 ])
    s23.start([ c1 ])
    s12.start([ c0 ])

    time.sleep(90)
    if ping == "yes":
        net.pingAllFull()
        time.sleep(60)
        
    if trafficFlag_iperf == "yes": 
        #Generate traffic
        print( "*** Generating traffic from TMs ***\n" )
        time_start = time.time()
        hosts = net.hosts
        trafficGen_iperf(hosts,tm)
        time_end = time.time()
        total_time_generating_traffic = time_end - time_start
        print("--- Total time generating traffic: ",total_time_generating_traffic,"s ---")

    info("Arrancando CLI\n")
    CLI( net )

    info("Parando la res\n")
    net.stop()


if __name__ == '__main__':
    #Cleaning up mininet
    os.system("sudo mn -c")

    # Tell mininet to print useful information
    setLogLevel( 'info' )

    # Default parameters
    controllerIp1 = "192.168.101.97"
    controllerIp2 = "192.168.101.99"
    controllerPort1 = 6634
    controllerPort2 = 6635
    trafficFlag_iperf = "no"
    trafficFlag_ditg = "no"
    ping = "no"
    ac = "no"
    tm = "0,1"

    # Obtain parameters from arguments
    error = False
    for arg in sys.argv[1:]:
        option = arg.split("=")
        if (option[0] == "--controllerIp1"):
            controllerIp1 = option[1]
        elif (option[0] == "--controllerPort1"):
            controllerPort1 = int(option[1])
        elif (option[0] == "--controllerIp2"):
            controllerIp2 = option[1]
        elif (option[0] == "--controllerPort2"):
            controllerPort2 = int(option[1])
        elif (option[0] == "--iperf"):
            trafficFlag_iperf = option[1]
        elif (option[0] == "--ditg"):
            trafficFlag_ditg = option[1]
        elif (option[0] == "--ping"):
            ping = option[1]
        elif (option[0] == "--ac"):
            ac = option[1]
        elif (option[0] == "--tm"):
            tm = option[1]
        else:
            print ("Option %s is not valid" % option[0])
            error = True

    if (error == False):
        # Launch the network
        multiController(controllerIp1=controllerIp1, controllerIp2=controllerIp2, 
                        controllerPort1=controllerPort1, controllerPort2=controllerPort2, 
                        trafficFlag_iperf=trafficFlag_iperf, trafficFlag_ditg=trafficFlag_ditg, 
                        ping=ping, ac=ac, tm=tm)     
    else:
        print ("Error running the network")
