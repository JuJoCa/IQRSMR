 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 19001 -u -b 1.499k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 19002 -u -b 16.262k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 19003 -u -b 15.713k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 19004 -u -b 212.881k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 19005 -u -b 0.467k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 19006 -u -b 1.957k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 19007 -u -b 44.853k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 19008 -u -b 1.234k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 19009 -u -b 46.053k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 19011 -u -b 1.246k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 19012 -u -b 194.366k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 19013 -u -b 51.684k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 19014 -u -b 0.012k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 19015 -u -b 0.408k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 19016 -u -b 124.090k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 19017 -u -b 5.508k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 19018 -u -b 34.543k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 19020 -u -b 23.827k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 19021 -u -b 9.721k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 19022 -u -b 18.481k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 19023 -u -b 2.604k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-12-00/client_19/clientOutput_19_to_23.json &
sleep 0.4