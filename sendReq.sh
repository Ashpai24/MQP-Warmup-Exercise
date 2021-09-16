#! /bin/bash
echo "Restarting NginX Server"
sudo systemctl restart nginx
echo "Server Restart is complete"
echo "------------------------------------------"
LOCAL_HOST="http://localhost:81/"
declare -a command_array

command_array=("tenKB", "oneHunderedKB", "oneMB", "twoMB", "eightMB", "tenMB")
#! Use h2load to send requests to each of the server location points

for request in "${command_array[@]}"
do
  echo "Sending request to:""$LOCAL_HOST""$request"
  h2load -n1000 -c100 -m10 --h1 "$LOCAL_HOST""$request"
  echo "Completed request to:""$LOCAL_HOST""$request"
  echo "-------------------------------------------------------------"
done

echo "Completed HTTP Load Testing Script"
