#! /bin/bash

if [ $# -ne 1 ]
then
	cat << EOF 
	
	Usage: $0 Name 

	Example: $0 kafka		: Start destroy Apache Kafak from vagrant
	
	Example: $0 kub 		: Start destroy K8s Cluster from vagrant 

EOF
exit 1
fi
export path=$(echo "`pwd`")
if [ $1 = "all" ]
then
for j in $(eval echo $1)
        do echo "Starting installation of $j servers"
        cd $path/apps/kafka
        vagrant destroy -f kafka1
        sleep 3
        cd $path/apps/kub
        vagrant destroy -f k8s-master node-1 node-2
        sleep 3
        cd $path/apps/app
        vagrant destroy -f app
        echo "Removing of $j hosts Completed Succussfually"       
done
elif [ $1 = "kafka" ] || [ $1 = "kub" ] || [ $1 = "app" ]
then 
   for i in $(eval echo $1)
        do echo "Starting removing of $i"
        cd $path/apps/$i
        vagrant destroy -f $i
        sleep 3
        echo "Removing of $i host Completed Succussfually"       
	done
else
echo "Sorry Your Input in undefined !!"
fi
