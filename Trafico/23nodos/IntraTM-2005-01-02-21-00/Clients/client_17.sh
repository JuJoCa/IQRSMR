 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 17001 -u -b 31.902k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 17002 -u -b 127.687k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 17003 -u -b 86.361k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 17004 -u -b 973.679k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 17005 -u -b 1741.156k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 17006 -u -b 1.092k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 17007 -u -b 89.469k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 17008 -u -b 1150.985k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 17009 -u -b 1693.741k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 17011 -u -b 1207.857k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 17012 -u -b 76.717k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 17013 -u -b 18.779k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 17014 -u -b 222.170k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 17015 -u -b 1.007k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 17016 -u -b 13.120k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 17018 -u -b 3.790k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 17019 -u -b 3.933k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 17020 -u -b 3.024k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 17021 -u -b 61.382k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 17022 -u -b 170.227k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 17023 -u -b 1.586k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-21-00/client_17/clientOutput_17_to_23.json &
sleep 0.4