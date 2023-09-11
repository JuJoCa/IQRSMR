 #!/bin/bash 
echo Initializing server listening...
            
iperf3 -s -p 1015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_1_to_15.json &
sleep 0.3
iperf3 -s -p 2015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_2_to_15.json &
sleep 0.3
iperf3 -s -p 3015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_3_to_15.json &
sleep 0.3
iperf3 -s -p 4015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_4_to_15.json &
sleep 0.3
iperf3 -s -p 5015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_5_to_15.json &
sleep 0.3
iperf3 -s -p 7015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_7_to_15.json &
sleep 0.3
iperf3 -s -p 8015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_8_to_15.json &
sleep 0.3
iperf3 -s -p 9015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_9_to_15.json &
sleep 0.3
iperf3 -s -p 10015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_10_to_15.json &
sleep 0.3
iperf3 -s -p 11015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_11_to_15.json &
sleep 0.3
iperf3 -s -p 12015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_12_to_15.json &
sleep 0.3
iperf3 -s -p 13015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_13_to_15.json &
sleep 0.3
iperf3 -s -p 17015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_17_to_15.json &
sleep 0.3
iperf3 -s -p 19015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_19_to_15.json &
sleep 0.3
iperf3 -s -p 21015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_21_to_15.json &
sleep 0.3
iperf3 -s -p 23015 -1 -J --logfile serverOutputs/IntraTM-2005-01-02-19-00/server_15/serverOutput_23_to_15.json &
sleep 0.3