 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 22001 -u -b 3.687k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 22002 -u -b 43.429k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 22003 -u -b 6.585k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 22004 -u -b 186.159k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 22005 -u -b 68.930k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 22006 -u -b 0.155k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 22007 -u -b 14.729k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 22008 -u -b 33.110k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 22009 -u -b 21.426k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 22011 -u -b 49.859k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 22012 -u -b 69.957k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 22013 -u -b 34.684k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 22014 -u -b 0.541k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 22016 -u -b 0.267k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 22017 -u -b 91.377k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 22018 -u -b 37.725k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 22019 -u -b 2.658k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 22021 -u -b 22.232k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 22023 -u -b 0.170k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_22/clientOutput_22_to_23.json &
sleep 0.4