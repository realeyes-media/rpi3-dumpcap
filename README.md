# rpi3-dumpcap

[![Docker Repository on Quay](https://quay.io/repository/realeyes/rpi3-dumpcap/status "Docker Repository on Quay")](https://quay.io/repository/realeyes/rpi3-dumpcap)

Dumpcap container for capturing traffic and dumping to disk on Raspberry Pi 3. The default command executes dumpcap with the following parameters:

* -P Use Pcap format
* -a duration:x number of seconds to capture
* -b filesize:x number of kB for each file in buffer ring
* -b files:x number of separate files in buffer ring
* -C x Max number of bytes of memory to use
* -f x Capture filter expression
* -i x Specify interface to capture
* -w x Specify outfile

To capture traffic on an interface, there needs to be an interface attached from the host (using host-networking and a privileged container) or a mirrored port (see http://stevemcgrath.io/2017/07/docker-containers--network-sniffing/ for an example of how to accomplish this) attached - otherwise, dumpcap is just capturing its own traffic. If you attach it to a docker network, the default CMD will pick up "eth0" in the container and just work.

You'll also need a way to get logs out of the container on to the host/into a defined volume - make sure to specify a bind mount from /opt/tsharklogs to a host folder at the minimum, or a volume if this conatiner is running in a system with access to external storage.

Here's the command we run on a Raspberry Pi 3 with a mirrored network port set up as a docker network (named "span" here, but the name isn't important) on the host with a bind mounted directory:

docker run -it -v /opt/tsharklogs:/opt/tsharklogs --network=span quay.io/realeyes/rpi3-dumpcap
