 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 18001 -u -b 9.356k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 18002 -u -b 272.097k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 18003 -u -b 0.308k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 18004 -u -b 20.794k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 18005 -u -b 2.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 18007 -u -b 1.274k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 18008 -u -b 0.403k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 18009 -u -b 1.503k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 18011 -u -b 0.434k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 18012 -u -b 1018.209k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 18013 -u -b 0.328k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 18014 -u -b 0.006k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 18015 -u -b 0.029k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 18016 -u -b 0.009k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 18017 -u -b 362.006k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 18019 -u -b 0.400k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 18020 -u -b 0.153k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 18021 -u -b 0.627k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 18022 -u -b 0.929k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 18023 -u -b 0.015k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-01-00/client_18/clientOutput_18_to_23.json &
sleep 0.4