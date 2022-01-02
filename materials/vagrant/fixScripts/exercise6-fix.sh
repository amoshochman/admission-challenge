#we need to check if we can first ssh and then copy everything
#we need to check if we can call the script from both places it's requested to

dest_folder="${@: -1}"
temp_folder=$(mktemp -d --tmpdir=/vagrant)/
hostname=$(hostname)
#bytes=0

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
  #bytes+=1
  shift
done

#echo $bytes

rm -r $temp_folder

