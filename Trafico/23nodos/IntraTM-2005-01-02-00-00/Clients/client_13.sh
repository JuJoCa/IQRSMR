 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 13001 -u -b 25.938k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 13002 -u -b 844.468k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 13003 -u -b 43.375k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 13005 -u -b 40.040k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 13006 -u -b 0.178k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 13007 -u -b 46.413k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 13008 -u -b 9.897k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 13009 -u -b 194.100k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 13011 -u -b 62.351k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 13012 -u -b 324.820k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 13014 -u -b 21.762k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 13015 -u -b 21.289k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 13016 -u -b 85.132k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 13017 -u -b 576.596k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 13018 -u -b 36.805k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 13019 -u -b 205.783k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 13020 -u -b 128.755k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 13021 -u -b 224.650k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 13022 -u -b 227.385k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 13023 -u -b 7.812k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_13/clientOutput_13_to_23.json &
sleep 0.4