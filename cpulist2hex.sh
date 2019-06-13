#!/bin/bash

# This bash script converts from kernel cpulists to a hex bitmask, with
# 32 bit comma separation, like the kernel needs for cpumasks.
# This script will fail silently if a core is repeated in the
# list. i.e. 2-5,6,7,2
#
## ./cpulist2hex.sh 2,8-130,5
# FFFFFFFF,FFFFFFFF,FFFFFFFF,FFFFFF02

range=$1
cores=()

dec2hex() {
   echo "obase=16;ibase=10;$1"|bc |  tr -d '\n'
}

IFS=',' read -ra parts <<<$range
for part in "${parts[@]}"; do
    [[ $part =~ - ]] && cores+=($(eval echo {${part/-/..}})) || cores+=($part)
done

# This should be optimized to remove the hardcoded limit for 128 cores,
# Go ahead, make my day punk.

res_low=0
sweep=0
sweep_high=32
res_arr=()
while [ $sweep -lt 1024 ]; do
      for core in ${cores[*]}; do
	  if [ $core -lt $sweep_high ] && [ $core -ge $sweep ]; then
	      res_low=$(($res_low + (1 << ($core - $sweep))))
	  fi
      done
      sweep=$(($sweep + 32))
      sweep_high=$(($sweep_high + 32))
      res_arr+=($res_low)
      res_low=0
done

for (( idx=${#res_arr[@]}-1 ; idx>=0 ; idx-- )) ; do
    #echo "${res_arr[idx]}"
    if [ ${res_arr[idx]} -ne  0 ]; then
	if [ $idx -ne 0 ]; then
	    tmp= dec2hex ${res_arr[idx]}
	    echo -n "$tmp,"
	else
	    tmp= dec2hex ${res_arr[idx]}
	    echo "$tmp"
	fi
    fi
done
