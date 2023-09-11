 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 7001 -u -b 22.104k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 7002 -u -b 58.270k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 7003 -u -b 2.114k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 7004 -u -b 274.779k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 7005 -u -b 7.576k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 7006 -u -b 0.672k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 7008 -u -b 5.130k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 7009 -u -b 0.347k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 7011 -u -b 12.273k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 7012 -u -b 58.529k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 7013 -u -b 0.342k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 7014 -u -b 0.388k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 7015 -u -b 2.232k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 7016 -u -b 3.397k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 7017 -u -b 67.343k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 7018 -u -b 2.380k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 7019 -u -b 1.599k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 7020 -u -b 0.726k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 7021 -u -b 19.469k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 7022 -u -b 45.233k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 7023 -u -b 0.723k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_07/clientOutput_7_to_23.json &
sleep 0.4