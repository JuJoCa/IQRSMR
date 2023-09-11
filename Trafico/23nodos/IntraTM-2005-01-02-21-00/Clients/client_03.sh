 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 3001 -u -b 40.652k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 3002 -u -b 26.599k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 3004 -u -b 254.081k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 3005 -u -b 5.033k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 3007 -u -b 29.117k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 3008 -u -b 1.862k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 3009 -u -b 0.223k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 3011 -u -b 1442.333k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 3012 -u -b 168.123k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 3013 -u -b 5.474k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 3014 -u -b 351.356k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 3015 -u -b 0.538k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 3016 -u -b 8.759k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 3017 -u -b 201.123k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 3018 -u -b 711.599k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 3019 -u -b 45.313k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 3020 -u -b 1.280k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 3021 -u -b 43.945k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 3022 -u -b 13.552k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 3023 -u -b 0.031k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_03/clientOutput_3_to_23.json &
sleep 0.4