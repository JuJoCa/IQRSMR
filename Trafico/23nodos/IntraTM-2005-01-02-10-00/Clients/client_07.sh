 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 7001 -u -b 190.073k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 7002 -u -b 143.924k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 7003 -u -b 42.311k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 7004 -u -b 283.570k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 7005 -u -b 8.551k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 7006 -u -b 3.067k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 7008 -u -b 8.010k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 7009 -u -b 28.866k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 7011 -u -b 20.930k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 7012 -u -b 105.577k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 7013 -u -b 5.208k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 7014 -u -b 0.636k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 7015 -u -b 3.908k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 7016 -u -b 17.101k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 7017 -u -b 211.629k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 7018 -u -b 22.274k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 7019 -u -b 22.548k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 7020 -u -b 25.957k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 7021 -u -b 136.524k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 7022 -u -b 53.973k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 7023 -u -b 3.069k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-10-00/client_07/clientOutput_7_to_23.json &
sleep 0.4