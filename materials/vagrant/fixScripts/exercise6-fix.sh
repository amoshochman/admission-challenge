#we need to check if we can first ssh and then copy everything
#we need to create temporary folder in wise way

dest_folder="${@: -1}"
temp_folder="/vagrant/tmp_amos/"
hostname=$(hostname)

mkdir $temp_folder

if [ $hostname == "server1" ]
then
  dest_server="server2"
else
  dest_server="server1"
fi

while (( $# > 1 ))
do
  cp $1 $temp_folder
  command="sudo cp "
  command+=$temp_folder
  command+="$(basename -- $1)"
  command+=" "
  command+=$dest_folder
  ssh vagrant@$dest_server $command
  shift
done

rm -r $temp_folder

