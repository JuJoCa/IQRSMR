 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 6001 -u -b 0.329k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 6002 -u -b 23.497k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 6004 -u -b 5.300k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 6005 -u -b 0.252k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 6007 -u -b 0.017k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 6008 -u -b 0.086k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 6011 -u -b 0.004k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 6012 -u -b 105.008k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 6013 -u -b 0.859k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 6016 -u -b 0.125k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 6017 -u -b 13.768k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 6019 -u -b 0.045k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 6021 -u -b 0.230k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 6022 -u -b 0.124k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 6023 -u -b 0.005k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-19-00/client_06/clientOutput_6_to_23.json &
sleep 0.4