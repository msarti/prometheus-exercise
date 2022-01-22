#!/bin/bash
declare -A map
for p in /hostproc/[0-9]*; do
  cg=`cat ${p}/cgroup`
  pid=`basename ${p}`
  value=${map["${cg}"]:-0}
  value=$((value+1))
  map["${cg}"]=$value
done

for cg in ${!map[@]}; do 
  echo "node_pids_current{cgroup=\"${cg}\"} ${map["${cg}"]:-0}.0"
done