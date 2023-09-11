 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 22001 -u -b 0.459k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 22002 -u -b 21.108k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 22003 -u -b 11.385k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 22004 -u -b 198.633k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 22005 -u -b 33.330k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 22006 -u -b 0.009k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 22007 -u -b 2.611k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 22008 -u -b 7.532k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 22009 -u -b 9.731k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 22011 -u -b 37.194k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 22012 -u -b 30.503k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 22013 -u -b 13.314k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 22014 -u -b 0.276k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 22016 -u -b 0.012k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 22017 -u -b 16.063k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 22018 -u -b 7.208k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 22019 -u -b 0.236k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 22021 -u -b 7.140k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 22023 -u -b 0.109k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_22/clientOutput_22_to_23.json &
sleep 0.4