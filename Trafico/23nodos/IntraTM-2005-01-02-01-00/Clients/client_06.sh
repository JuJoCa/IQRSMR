 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 6001 -u -b 0.168k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 6002 -u -b 14.141k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 6004 -u -b 0.619k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 6005 -u -b 0.055k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 6007 -u -b 0.028k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 6009 -u -b 0.126k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 6011 -u -b 0.003k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 6012 -u -b 69.307k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 6013 -u -b 0.021k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 6017 -u -b 9.543k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 6019 -u -b 0.021k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 6021 -u -b 0.004k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 6023 -u -b 0.005k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_06/clientOutput_6_to_23.json &
sleep 0.4