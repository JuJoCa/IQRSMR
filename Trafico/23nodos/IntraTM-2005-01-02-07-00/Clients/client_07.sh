 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 7001 -u -b 187.301k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 7002 -u -b 160.706k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 7003 -u -b 17.572k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 7004 -u -b 190.078k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 7005 -u -b 18.294k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 7006 -u -b 1.020k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 7008 -u -b 12.283k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 7009 -u -b 38.342k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 7011 -u -b 18.815k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 7012 -u -b 54.150k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 7013 -u -b 3.938k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 7014 -u -b 1.180k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 7015 -u -b 9.408k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 7016 -u -b 15.393k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 7017 -u -b 247.098k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 7018 -u -b 26.803k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 7019 -u -b 30.186k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 7020 -u -b 12.686k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 7021 -u -b 135.450k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 7022 -u -b 40.232k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 7023 -u -b 1.669k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_07/clientOutput_7_to_23.json &
sleep 0.4