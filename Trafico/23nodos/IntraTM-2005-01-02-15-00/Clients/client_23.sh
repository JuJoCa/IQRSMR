 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 23001 -u -b 0.467k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 23002 -u -b 0.600k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 23003 -u -b 2.577k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 23004 -u -b 9.863k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 23005 -u -b 0.156k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 23007 -u -b 3.460k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 23008 -u -b 0.464k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 23009 -u -b 0.415k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 23011 -u -b 0.241k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 23012 -u -b 4.146k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 23013 -u -b 3.197k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 23014 -u -b 0.005k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 23015 -u -b 0.889k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 23016 -u -b 0.059k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 23017 -u -b 1.638k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 23018 -u -b 0.711k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 23019 -u -b 0.417k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 23020 -u -b 1.534k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 23021 -u -b 42.527k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 23022 -u -b 0.719k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_23/clientOutput_23_to_22.json &
sleep 0.4