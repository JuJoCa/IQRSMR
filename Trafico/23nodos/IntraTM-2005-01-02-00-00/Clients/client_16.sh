 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 16001 -u -b 160.881k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 16002 -u -b 12.069k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 16003 -u -b 0.019k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 16004 -u -b 52.057k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 16005 -u -b 6.597k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 16007 -u -b 22.816k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 16008 -u -b 6.504k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 16009 -u -b 3.265k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 16011 -u -b 0.951k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 16012 -u -b 20.577k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 16013 -u -b 2.287k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 16014 -u -b 1.492k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 16017 -u -b 9.117k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 16018 -u -b 0.021k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 16019 -u -b 33.928k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 16021 -u -b 6.611k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 16023 -u -b 0.023k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_16/clientOutput_16_to_23.json &
sleep 0.4