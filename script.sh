cd app/
touch counter.txt
declare -i var=$(cat counter.txt)
for (( ; ; ))
do
   cat counter.txt
   SERVER=`hostname`
   var=$((var + 1))
   echo $SERVER" "$var >>counter.txt    
   sleepSeconds=$(echo $((1 + $RANDOM % 3)))
   sleep $sleepSeconds
done
