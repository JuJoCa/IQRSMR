 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 2001 -u -b 57.554k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 2003 -u -b 6.374k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 2004 -u -b 1319.529k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 2005 -u -b 26.804k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 2006 -u -b 119.871k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 2007 -u -b 59.572k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 2008 -u -b 20.412k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 2009 -u -b 79.767k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 2011 -u -b 77.166k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 2012 -u -b 1833.959k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 2013 -u -b 69.082k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 2014 -u -b 57.486k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 2015 -u -b 2.639k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 2016 -u -b 28.208k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 2017 -u -b 553.824k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 2018 -u -b 1281.548k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 2019 -u -b 79.615k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 2020 -u -b 16.347k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 2021 -u -b 86.514k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 2022 -u -b 42.939k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 2023 -u -b 0.043k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-07-00/client_02/clientOutput_2_to_23.json &
sleep 0.4