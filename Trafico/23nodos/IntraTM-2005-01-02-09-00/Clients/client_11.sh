 #!/bin/bash 
echo Generating traffic...
        
iperf3 -c 10.0.0.1 -p 11001 -u -b 5.549k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_1.json &
sleep 0.4
iperf3 -c 10.0.0.2 -p 11002 -u -b 1733.517k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_2.json &
sleep 0.4
iperf3 -c 10.0.0.3 -p 11003 -u -b 27.309k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_3.json &
sleep 0.4
iperf3 -c 10.0.0.4 -p 11004 -u -b 132.904k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_4.json &
sleep 0.4
iperf3 -c 10.0.0.5 -p 11005 -u -b 13.836k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_5.json &
sleep 0.4
iperf3 -c 10.0.0.6 -p 11006 -u -b 0.075k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_6.json &
sleep 0.4
iperf3 -c 10.0.0.7 -p 11007 -u -b 6.051k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_7.json &
sleep 0.4
iperf3 -c 10.0.0.8 -p 11008 -u -b 51.101k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_8.json &
sleep 0.4
iperf3 -c 10.0.0.9 -p 11009 -u -b 25.257k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_9.json &
sleep 0.4
iperf3 -c 10.0.0.12 -p 11012 -u -b 4053.942k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_12.json &
sleep 0.4
iperf3 -c 10.0.0.13 -p 11013 -u -b 52.446k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_13.json &
sleep 0.4
iperf3 -c 10.0.0.14 -p 11014 -u -b 0.294k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_14.json &
sleep 0.4
iperf3 -c 10.0.0.15 -p 11015 -u -b 22.359k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_15.json &
sleep 0.4
iperf3 -c 10.0.0.16 -p 11016 -u -b 6.230k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_16.json &
sleep 0.4
iperf3 -c 10.0.0.17 -p 11017 -u -b 1577.786k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_17.json &
sleep 0.4
iperf3 -c 10.0.0.18 -p 11018 -u -b 37.354k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_18.json &
sleep 0.4
iperf3 -c 10.0.0.19 -p 11019 -u -b 0.854k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_19.json &
sleep 0.4
iperf3 -c 10.0.0.20 -p 11020 -u -b 25.010k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_20.json &
sleep 0.4
iperf3 -c 10.0.0.21 -p 11021 -u -b 15.686k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_21.json &
sleep 0.4
iperf3 -c 10.0.0.22 -p 11022 -u -b 37.659k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_22.json &
sleep 0.4
iperf3 -c 10.0.0.23 -p 11023 -u -b 0.328k -w 256k -t 30 -J --logfile clientOutputs/IntraTM-2005-01-02-09-00/client_11/clientOutput_11_to_23.json &
sleep 0.4