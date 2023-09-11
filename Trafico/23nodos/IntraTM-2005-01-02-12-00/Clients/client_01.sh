 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.2 -p 1002 -u -b 184.920k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 1003 -u -b 571.990k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 1004 -u -b 157.464k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 1005 -u -b 3049.248k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 1006 -u -b 87.435k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 1007 -u -b 329.075k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 1008 -u -b 2307.666k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 1009 -u -b 3474.496k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 1011 -u -b 15.858k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 1012 -u -b 192.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 1013 -u -b 14.669k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 1014 -u -b 10.295k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 1015 -u -b 20.720k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 1016 -u -b 121.523k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 1017 -u -b 60.068k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 1018 -u -b 154.626k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 1019 -u -b 0.926k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 1020 -u -b 4.434k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 1021 -u -b 61.434k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 1022 -u -b 105.263k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 1023 -u -b 1.757k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_01/clientOutput_1_to_23.json &
sleep 0.4