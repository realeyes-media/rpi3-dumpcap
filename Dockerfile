FROM quay.io/realeyes/tshark-rpi3

RUN [ "cross-build-start" ]

RUN mkdir -p /opt/tsharklogs

WORKDIR /opt/tsharklogs

VOLUME /opt/tsharklogs

RUN [ "cross-build-end" ]

CMD [ "/usr/bin/dumpcap","-P","-a","duration:14400","-b","filesize:1000000","-b","files:14","-C","200000000","-f","tcp port 80","-i","eth0","-w","/opt/tsharklogs/testoutput.pcap" ]
