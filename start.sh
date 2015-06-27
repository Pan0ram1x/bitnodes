#!/bin/bash
python -u crawl.py crawl.conf master > crawl.master.out 2>&1 &
python -u crawl.py crawl.conf slave > crawl.slave.1.out 2>&1 &

python -u ping.py ping.conf master > ping.master.out 2>&1 &
python -u ping.py ping.conf slave > ping.slave.1.out 2>&1 &
python -u ping.py ping.conf slave > ping.slave.2.out 2>&1 &
python -u ping.py ping.conf slave > ping.slave.3.out 2>&1 &
python -u ping.py ping.conf slave > ping.slave.4.out 2>&1 &

# export GEVENT_RESOLVER=ares (Recommended only on Linux!)
python -u resolve.py resolve.conf > resolve.out 2>&1 &

python -u export.py export.conf > export.out 2>&1 &

python -u seeder.py seeder.conf > seeder.out 2>&1 &

python -u pcap.py pcap.conf > pcap.1.out 2>&1 &
python -u pcap.py pcap.conf > pcap.2.out 2>&1 &
