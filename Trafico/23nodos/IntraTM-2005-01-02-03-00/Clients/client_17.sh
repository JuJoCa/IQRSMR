 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 17001 -u -b 31.538k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 17002 -u -b 87.379k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 17003 -u -b 84.387k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 17004 -u -b 308.708k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 17005 -u -b 1678.290k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 17006 -u -b 1.774k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 17007 -u -b 50.514k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 17008 -u -b 738.951k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 17009 -u -b 1662.147k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 17011 -u -b 1035.666k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 17012 -u -b 70.389k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 17013 -u -b 8.499k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 17014 -u -b 232.334k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 17015 -u -b 0.550k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 17016 -u -b 6.732k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 17018 -u -b 2.631k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 17019 -u -b 1.406k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 17020 -u -b 1.810k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 17021 -u -b 54.608k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 17022 -u -b 13.798k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 17023 -u -b 0.160k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-03-00/client_17/clientOutput_17_to_23.json &
sleep 0.4