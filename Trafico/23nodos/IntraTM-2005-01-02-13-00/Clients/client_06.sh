 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 6001 -u -b 0.111k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 6002 -u -b 24.001k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 6003 -u -b 0.917k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 6004 -u -b 0.538k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 6005 -u -b 0.006k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 6007 -u -b 0.067k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 6008 -u -b 0.134k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 6011 -u -b 0.630k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 6012 -u -b 124.268k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 6013 -u -b 0.065k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 6017 -u -b 9.761k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 6018 -u -b 0.028k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 6019 -u -b 0.063k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 6021 -u -b 1.719k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 6022 -u -b 0.386k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 6023 -u -b 0.120k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-13-00/client_06/clientOutput_6_to_23.json &
sleep 0.4