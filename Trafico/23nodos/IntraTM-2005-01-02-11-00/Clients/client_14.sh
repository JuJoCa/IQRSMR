 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 14001 -u -b 4.424k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 14002 -u -b 55.305k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 14003 -u -b 0.673k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 14004 -u -b 21.649k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 14005 -u -b 0.279k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 14007 -u -b 1.484k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 14009 -u -b 0.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 14011 -u -b 1.214k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 14012 -u -b 194.611k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 14013 -u -b 0.604k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 14016 -u -b 0.304k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 14017 -u -b 59.694k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 14018 -u -b 0.004k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 14019 -u -b 0.314k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 14020 -u -b 0.570k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 14021 -u -b 3.048k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 14022 -u -b 6.440k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 14023 -u -b 0.148k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_14/clientOutput_14_to_23.json &
sleep 0.4