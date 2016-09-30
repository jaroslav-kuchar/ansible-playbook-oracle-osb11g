Vagrant.configure("2") do |config|

	# ubuntu box 
	config.vm.box = "ubuntu/trusty64"
	
	# configure box
	config.vm.hostname = "mi-mdw"
	config.vm.network :forwarded_port, guest: 7001, host: 7001

	# configure machine
	config.vm.provider :virtualbox do |vb|
    	vb.gui = true  
    	vb.customize ["modifyvm", :id, "--memory", "2048"]
    	vb.customize ["modifyvm", :id, "--vram", "256"]
    	vb.customize ["modifyvm", :id, "--cpus", "2"]
  	end

  	# increase swap: http://jeqo.github.io/blog/devops/vagrant-quickstart/
  	config.vm.provision "shell", path: "increase_swap.sh"

	# Use :ansible or :ansible_local to
	# select the provisioner of your choice
	config.vm.provision :ansible_local do |ansible|
		ansible.playbook = "main.yml"
		ansible.verbose = true
	end
end