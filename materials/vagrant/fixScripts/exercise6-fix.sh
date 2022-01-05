#!/bin/bash
dest_folder=${@: -1}
temp_folder=$(mktemp -d --tmpdir=/vagrant)/
hostname=$(hostname)
total_size=0

if [ $hostname == "server1" ]
then
  dest_server="server2"
else
  dest_server="server1"
fi

while (( $# > 1 ))
do
  cp $1 $temp_folder
  command="sudo cp ${temp_folder}"
  command+="$(basename -- $1) "
  command+=$dest_folder
  ssh vagrant@$dest_server $command
  cur_size=$(wc -c < $1)
  let total_size=$total_size+$cur_size
  shift
done

echo $total_size

rm -r $temp_folder
