 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 4001 -u -b 432.158k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 4002 -u -b 509.954k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 4003 -u -b 8.960k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 4005 -u -b 16.148k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 4006 -u -b 0.270k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 4007 -u -b 236.738k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 4008 -u -b 10.687k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 4009 -u -b 58.859k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 4011 -u -b 68.346k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 4012 -u -b 150.437k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 4014 -u -b 8.336k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 4015 -u -b 67.330k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 4016 -u -b 28.403k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 4017 -u -b 1389.375k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 4018 -u -b 16.680k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 4019 -u -b 63.534k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 4020 -u -b 20.431k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 4021 -u -b 55.769k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 4022 -u -b 68.691k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 4023 -u -b 0.115k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-05-00/client_04/clientOutput_4_to_23.json &
sleep 0.4