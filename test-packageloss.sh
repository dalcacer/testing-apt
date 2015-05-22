#!/bin/bash
OUT=apt-packageloss.txt
TIME=/usr/bin/time
cat /dev/null > $OUT

function measure() {
  echo "$1 package loss" >> $OUT
  tc qdisc add dev eth0 root netem loss $1%

  for i in {1..5}
  do
    ($TIME -f "%e" apt-get install -y nginx) 2>> $OUT
    sudo apt-get remove -y nginx
    sudo apt-get -y autoremove
    sudo apt-get clean

    sleep 1
  done

  tc qdisc del dev eth0 root netem loss $1%
}



for i in {0..50..5}
  do
    measure $i
  done
