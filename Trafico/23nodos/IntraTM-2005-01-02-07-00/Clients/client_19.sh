 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 19001 -u -b 23.560k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 19002 -u -b 16.179k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 19003 -u -b 1.105k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 19004 -u -b 165.361k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 19005 -u -b 36.283k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 19006 -u -b 2.518k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 19007 -u -b 63.399k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 19008 -u -b 0.390k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 19009 -u -b 3.345k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 19011 -u -b 1.533k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 19012 -u -b 165.587k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 19013 -u -b 5.430k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 19014 -u -b 0.143k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 19015 -u -b 0.322k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 19016 -u -b 52.596k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 19017 -u -b 156.957k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 19018 -u -b 0.614k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 19020 -u -b 0.249k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 19021 -u -b 30.771k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 19022 -u -b 5.595k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 19023 -u -b 0.544k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_19/clientOutput_19_to_23.json &
sleep 0.4