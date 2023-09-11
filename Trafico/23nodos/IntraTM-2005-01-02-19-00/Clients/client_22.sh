 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 22001 -u -b 0.619k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 22002 -u -b 15.535k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 22003 -u -b 0.798k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 22004 -u -b 53.557k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 22005 -u -b 17.003k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 22006 -u -b 0.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 22007 -u -b 3.259k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 22008 -u -b 4.328k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 22009 -u -b 5.730k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 22011 -u -b 8.321k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 22012 -u -b 24.971k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 22013 -u -b 8.017k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 22014 -u -b 0.007k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 22016 -u -b 0.182k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 22017 -u -b 15.453k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 22018 -u -b 1.937k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 22019 -u -b 0.583k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 22021 -u -b 8.340k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 22023 -u -b 0.014k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_22/clientOutput_22_to_23.json &
sleep 0.4