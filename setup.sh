#!/bin/bash






echo 'Scripts'





# create the VagrantFile
action="$1"


function hello (){
 echo Hello $1
}

function build() {
 echo Setup!

 echo ToDo $1 Slaves: [$2]
 echo "Vagrant.configure('2') do |config|" > Vagrantfile
 # echo " config.vm.box = '$2'" >> Vagrantfile

 	# master nodes
	vm="precise64"
	echo " config.vm.define :$vm do |$vm|" >> Vagrantfile
	echo "  $vm.vm.box = '$2'" >> Vagrantfile
	echo "  $vm.vm.provision :shell, :inline => \"sudo apt-get update\""  >> Vagrantfile
	echo "  $vm.vm.provision :shell, :path => \"manifests/manifest\"" >> Vagrantfile
	echo " end" >> Vagrantfile

	# slave nodes
	for i in $(seq 1 $1);
	do
			vm="slave$i"
			echo " config.vm.define :$vm do |$vm|" >> Vagrantfile
			echo "  $vm.vm.box = '$2'" >> Vagrantfile
			echo "  $vm.vm.provision :shell, :inline => \"apt-get update\""  >> Vagrantfile
			echo "  $vm.vm.provision :shell, :inline => \"sudo manifests/manifest\"" >> Vagrantfile
			echo "  $vm.vm.provision :puppet do |puppet|"  >> Vagrantfile
			echo "   puppet.manifests_path = \"manifests\""  >> Vagrantfile
			echo "   puppet.manifest_file = \"isite.pp\""  >> Vagrantfile
			echo "   puppet.module_path = \"modules\""  >> Vagrantfile
			echo "  end" >> Vagrantfile
			echo " end" >> Vagrantfile
	done
 


 echo "end" >> Vagrantfile

}



function clear(){

vagrant destroy

}

function start(){

vagrant up

}

function stop(){

vagrant halt

}

function status(){

VBoxManage list runningvms

}


case "$1" in
	hello)
		hello $2
		;;

	build)
        build $2 $3
        ;;
    rbuild)
		stop
		build $2 $3
		start
		;;
    start)
        start
        ;;

    stop)
        stop
        ;;

	status)
        status
        ;;

    restart)
		stop
        start
        ;;

	clear)
		clear
		;;
	*)
        echo $"Usage: $0 {start|stop|restart|condrestart|status}"
        exit 1
 
esac

echo ---------------------------------------------------
cat Vagrantfile
echo ---------------------------------------------------