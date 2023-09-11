 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 6001 -u -b 1.208k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 6002 -u -b 28.803k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 6003 -u -b 0.233k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 6004 -u -b 0.724k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 6007 -u -b 1.555k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 6008 -u -b 0.118k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 6009 -u -b 0.029k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 6011 -u -b 0.219k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 6012 -u -b 115.614k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 6013 -u -b 0.212k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 6015 -u -b 0.500k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 6016 -u -b 0.676k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 6017 -u -b 21.278k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 6018 -u -b 0.130k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 6019 -u -b 0.718k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 6020 -u -b 0.029k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 6021 -u -b 0.930k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 6022 -u -b 0.452k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 6023 -u -b 0.003k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-11-00/client_06/clientOutput_6_to_23.json &
sleep 0.4