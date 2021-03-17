#! /bin/bash

if [ $# -ne 1 ]
then
	cat << EOF 
	
	Usage: $0 Name 

	Example: $0 kafka		: Start installing Apache Kafak in vagrant VM
	
	Example: $0 kub 		: Start install K8s Cluster in vagrant VMs

EOF
exit 1
fi
export path=$(echo "`pwd`")
if [ $1 = "all" ]
then
for j in $(eval echo $1)
        do echo "Starting installation of $j servers"
        cd $path/apps/kafka
        vagrant up
        sleep 3
        cd $path/apps/kub
        vagrant up
        sleep 3
        cd $path/apps/app
        vagrant up      
done
elif [ $1 = "kafka" ] || [ $1 = "kub" ] || [ $1 = "app" ]
then 
   for i in $(eval echo $1)
        do echo "Starting installation of $i"
        cd $path/apps/$i
        vagrant up   
	done
else
echo "Sorry Your Input in undefined !!"
fi

