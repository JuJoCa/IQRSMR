 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.2 -p 1002 -u -b 39.679k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 1003 -u -b 29.754k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 1004 -u -b 242.423k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 1005 -u -b 2796.133k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 1006 -u -b 79.919k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 1007 -u -b 30.242k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 1008 -u -b 1760.755k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 1009 -u -b 2803.940k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 1011 -u -b 8.348k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 1012 -u -b 185.242k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 1013 -u -b 15.176k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 1014 -u -b 4.319k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 1015 -u -b 8.345k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 1016 -u -b 82.335k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 1017 -u -b 41.077k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 1018 -u -b 201.088k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 1019 -u -b 1.481k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 1020 -u -b 10.291k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 1021 -u -b 54.631k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 1022 -u -b 63.700k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 1023 -u -b 1.723k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_01/clientOutput_1_to_23.json &
sleep 0.4