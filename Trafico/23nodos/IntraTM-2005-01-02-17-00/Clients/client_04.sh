 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 4001 -u -b 124.736k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 4002 -u -b 544.297k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 4003 -u -b 4.588k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 4005 -u -b 24.719k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 4006 -u -b 0.024k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 4007 -u -b 311.060k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 4008 -u -b 28.545k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 4009 -u -b 21.894k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 4011 -u -b 133.249k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 4012 -u -b 228.977k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 4014 -u -b 28.133k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 4015 -u -b 4.931k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 4016 -u -b 20.797k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 4017 -u -b 236.158k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 4018 -u -b 21.224k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 4019 -u -b 63.583k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 4020 -u -b 50.849k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 4021 -u -b 86.590k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 4022 -u -b 45.307k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 4023 -u -b 0.364k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-17-00/client_04/clientOutput_4_to_23.json &
sleep 0.4