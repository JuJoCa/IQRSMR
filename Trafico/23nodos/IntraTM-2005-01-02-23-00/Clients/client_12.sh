 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 12001 -u -b 70.376k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 12002 -u -b 758.695k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 12003 -u -b 120.551k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 12004 -u -b 952.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 12005 -u -b 28.046k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 12006 -u -b 1.252k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 12007 -u -b 43.191k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 12008 -u -b 13.762k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 12009 -u -b 41.225k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 12011 -u -b 44.494k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 12013 -u -b 144.653k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 12014 -u -b 3.201k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 12015 -u -b 2.802k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 12016 -u -b 37.147k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 12017 -u -b 611.033k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 12018 -u -b 25.275k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 12019 -u -b 14.236k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 12020 -u -b 14.236k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 12021 -u -b 84.275k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 12022 -u -b 52.738k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 12023 -u -b 0.940k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-23-00/client_12/clientOutput_12_to_23.json &
sleep 0.4