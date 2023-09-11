 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 12001 -u -b 120.058k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 12002 -u -b 1022.836k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 12003 -u -b 141.446k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 12004 -u -b 1149.221k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 12005 -u -b 228.528k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 12006 -u -b 0.581k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 12007 -u -b 116.136k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 12008 -u -b 25.859k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 12009 -u -b 243.020k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 12011 -u -b 93.809k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 12013 -u -b 264.382k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 12014 -u -b 13.811k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 12015 -u -b 147.755k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 12016 -u -b 51.478k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 12017 -u -b 953.966k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 12018 -u -b 31.082k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 12019 -u -b 53.921k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 12020 -u -b 110.707k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 12021 -u -b 318.601k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 12022 -u -b 568.939k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 12023 -u -b 22.047k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_12/clientOutput_12_to_23.json &
sleep 0.4