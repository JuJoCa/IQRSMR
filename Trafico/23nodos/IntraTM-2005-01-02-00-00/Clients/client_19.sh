 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 19001 -u -b 2.942k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 19002 -u -b 10.216k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 19004 -u -b 182.278k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 19005 -u -b 0.608k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 19006 -u -b 0.442k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 19007 -u -b 46.261k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 19009 -u -b 81.192k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 19011 -u -b 11.888k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 19012 -u -b 119.065k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 19013 -u -b 3.127k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 19014 -u -b 0.004k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 19016 -u -b 61.298k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 19017 -u -b 0.688k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 19018 -u -b 0.038k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 19020 -u -b 0.468k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 19021 -u -b 7.097k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 19022 -u -b 0.211k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 19023 -u -b 0.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_19/clientOutput_19_to_23.json &
sleep 0.4