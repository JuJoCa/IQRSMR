 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 8001 -u -b 1.854k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 8002 -u -b 1081.995k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 8004 -u -b 56.911k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 8005 -u -b 15.889k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 8006 -u -b 0.004k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 8007 -u -b 0.535k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 8009 -u -b 3.275k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 8011 -u -b 15.191k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 8012 -u -b 2783.215k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 8013 -u -b 5.627k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 8015 -u -b 2.182k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 8016 -u -b 2.269k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 8017 -u -b 1041.037k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 8018 -u -b 0.762k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 8019 -u -b 0.149k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 8020 -u -b 2.599k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 8021 -u -b 1.681k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 8022 -u -b 4.005k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 8023 -u -b 13.964k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_08/clientOutput_8_to_23.json &
sleep 0.4