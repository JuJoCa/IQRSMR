 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 11001 -u -b 3.889k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 11002 -u -b 1634.012k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 11003 -u -b 3.483k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 11004 -u -b 118.782k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 11005 -u -b 10.667k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 11006 -u -b 0.989k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 11007 -u -b 1.550k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 11008 -u -b 4.175k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 11009 -u -b 16.725k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 11012 -u -b 4188.067k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 11013 -u -b 24.041k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 11014 -u -b 1.009k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 11015 -u -b 2.487k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 11016 -u -b 4.647k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 11017 -u -b 1478.423k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 11018 -u -b 4.880k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 11019 -u -b 0.166k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 11020 -u -b 17.351k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 11021 -u -b 4.052k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 11022 -u -b 20.002k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 11023 -u -b 0.295k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_11/clientOutput_11_to_23.json &
sleep 0.4