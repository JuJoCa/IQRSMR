 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 4001 -u -b 107.796k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 4002 -u -b 498.306k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 4003 -u -b 3.391k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 4005 -u -b 10.177k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 4007 -u -b 333.340k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 4008 -u -b 8.724k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 4009 -u -b 30.027k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 4011 -u -b 58.069k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 4012 -u -b 106.999k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 4014 -u -b 9.875k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 4015 -u -b 3.309k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 4016 -u -b 10.010k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 4017 -u -b 856.814k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 4018 -u -b 18.117k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 4019 -u -b 56.916k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 4020 -u -b 487.792k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 4021 -u -b 61.209k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 4022 -u -b 30.814k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-00-00/client_04/clientOutput_4_to_22.json &
sleep 0.4