 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 14001 -u -b 0.296k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 14002 -u -b 69.074k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 14003 -u -b 0.351k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 14004 -u -b 24.085k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 14005 -u -b 0.036k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 14007 -u -b 0.795k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 14008 -u -b 0.005k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 14009 -u -b 0.598k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 14011 -u -b 0.146k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 14012 -u -b 218.837k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 14013 -u -b 0.364k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 14016 -u -b 0.110k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 14017 -u -b 101.557k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 14018 -u -b 0.126k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 14019 -u -b 0.054k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 14020 -u -b 0.004k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 14021 -u -b 2.142k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 14022 -u -b 0.044k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_14/clientOutput_14_to_22.json &
sleep 0.4