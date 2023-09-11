 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 14001 -u -b 0.486k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 14002 -u -b 48.678k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 14003 -u -b 0.552k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 14004 -u -b 18.477k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 14005 -u -b 0.364k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 14007 -u -b 0.609k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 14009 -u -b 0.049k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 14011 -u -b 0.344k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 14012 -u -b 129.171k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 14013 -u -b 0.294k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 14016 -u -b 0.950k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 14017 -u -b 84.258k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 14018 -u -b 0.135k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 14019 -u -b 0.047k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 14020 -u -b 0.027k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 14021 -u -b 1.039k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 14022 -u -b 0.059k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_14/clientOutput_14_to_22.json &
sleep 0.4