 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 15001 -u -b 7.062k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 15002 -u -b 1.505k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 15003 -u -b 0.088k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 15004 -u -b 33.099k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 15005 -u -b 22.709k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 15007 -u -b 21.992k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 15008 -u -b 0.286k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 15009 -u -b 5.274k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 15011 -u -b 1.013k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 15012 -u -b 51.499k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 15013 -u -b 4.934k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 15017 -u -b 0.589k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 15018 -u -b 0.052k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 15019 -u -b 0.049k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 15021 -u -b 0.995k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 15023 -u -b 0.075k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_15/clientOutput_15_to_23.json &
sleep 0.4