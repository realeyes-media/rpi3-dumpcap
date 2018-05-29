# rpi3-dumpcap
Dumpcap container for capturing traffic and dumping to disk on Raspberry Pi 3. The default command executes dumpcap with the following parameters:

* -P Use Pcap format
* -a duration:x number of seconds to capture
* -b filesize:x number of kB for each file in buffer ring
* -b files:x number of separate files in buffer ring
* -C x Max number of bytes of memory to use
* -f x Capture filter expression
* -i x Specify interface to capture
* -w x Specify outfile

To capture traffic on an interface, there needs to be an interface attached from the host (using host-networking and a privileged container) or a mirrored port (see http://stevemcgrath.io/2017/07/docker-containers--network-sniffing/ for an example of how to accomplish this) attached - otherwise, dumpcap is just capturing its own traffic.
