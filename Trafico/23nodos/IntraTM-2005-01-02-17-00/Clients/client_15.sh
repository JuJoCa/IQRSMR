 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 15001 -u -b 4.606k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 15002 -u -b 2.571k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 15003 -u -b 0.097k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 15004 -u -b 96.248k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 15005 -u -b 3.338k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 15007 -u -b 5.019k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 15008 -u -b 0.328k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 15009 -u -b 4.272k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 15011 -u -b 7.722k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 15012 -u -b 68.934k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 15013 -u -b 21.264k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 15014 -u -b 0.012k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 15017 -u -b 1.690k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 15018 -u -b 0.167k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 15019 -u -b 0.863k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 15021 -u -b 1.908k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 15023 -u -b 0.051k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_15/clientOutput_15_to_23.json &
sleep 0.4