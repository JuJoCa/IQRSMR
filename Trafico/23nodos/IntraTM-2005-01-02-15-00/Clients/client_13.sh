 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 13001 -u -b 58.234k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 13002 -u -b 1631.744k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 13003 -u -b 103.316k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 13004 -u -b 0.270k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 13005 -u -b 263.262k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 13006 -u -b 1.000k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 13007 -u -b 145.101k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 13008 -u -b 141.685k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 13009 -u -b 263.187k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.11 -p 13011 -u -b 161.292k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_11.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 13012 -u -b 626.476k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 13014 -u -b 49.811k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 13015 -u -b 29.503k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 13016 -u -b 105.339k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 13017 -u -b 593.575k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 13018 -u -b 77.921k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 13019 -u -b 154.601k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 13020 -u -b 160.552k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 13021 -u -b 307.860k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 13022 -u -b 199.454k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 13023 -u -b 1.560k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-15-00/client_13/clientOutput_13_to_23.json &
sleep 0.4