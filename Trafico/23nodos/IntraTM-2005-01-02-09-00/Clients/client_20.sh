 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 20001 -u -b 2.390k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 20002 -u -b 252.397k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 20003 -u -b 67.929k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 20004 -u -b 66.252k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 20005 -u -b 39.688k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 20006 -u -b 0.049k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 20007 -u -b 3.131k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 20008 -u -b 7.125k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 20009 -u -b 119.709k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 20011 -u -b 50.827k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 20012 -u -b 80.812k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 20013 -u -b 54.927k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 20014 -u -b 0.006k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 20017 -u -b 24.277k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 20018 -u -b 2.485k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 20019 -u -b 2.308k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 20021 -u -b 50.502k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 20022 -u -b 0.267k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 20023 -u -b 0.521k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_20/clientOutput_20_to_23.json &
sleep 0.4