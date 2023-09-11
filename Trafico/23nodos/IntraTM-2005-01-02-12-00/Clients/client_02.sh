 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 2001 -u -b 27.162k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 2003 -u -b 66.508k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 2004 -u -b 1236.214k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 2005 -u -b 8.415k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 2006 -u -b 65.215k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 2007 -u -b 53.812k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 2008 -u -b 13.939k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 2009 -u -b 125.687k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 2011 -u -b 101.623k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 2012 -u -b 1667.277k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 2013 -u -b 54.851k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 2014 -u -b 5.116k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 2015 -u -b 1.113k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 2016 -u -b 26.635k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 2017 -u -b 188.052k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 2018 -u -b 1695.020k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 2019 -u -b 43.968k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 2020 -u -b 27.293k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 2021 -u -b 157.894k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 2022 -u -b 21.500k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 2023 -u -b 0.058k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_02/clientOutput_2_to_23.json &
sleep 0.4