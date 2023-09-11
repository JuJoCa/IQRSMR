 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 20001 -u -b 0.367k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 20002 -u -b 19.324k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 20003 -u -b 7.403k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 20004 -u -b 54.969k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 20005 -u -b 9.758k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 20007 -u -b 0.858k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 20008 -u -b 6.475k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 20009 -u -b 30.358k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 20011 -u -b 1.242k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 20012 -u -b 44.746k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 20013 -u -b 10.691k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 20014 -u -b 0.135k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 20017 -u -b 5.459k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 20018 -u -b 0.005k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 20019 -u -b 0.014k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 20021 -u -b 0.644k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_20/clientOutput_20_to_21.json &
sleep 0.4