# Ansible playbook - Oracle Service Bus 11g development environment

Designed for Middleware and Web Services [CTU](http://fit.cvut.cz/en/) course that is a part of Web engineering curricula.
It contains an ansible playbook for Oracle Web Logic and Oracle Service Bus 11g together with configuration of and development environment.

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Oracle Service Bus 11gR1](http://www.oracle.com/technetwork/middleware/service-bus/downloads/index.html)
  * Download **generic** versions (Registration required)
    * Oracle WebLogic Server 11gR1 (10.3.6) + Coherence - Package Installer
    * Oracle Service Bus
  * Copy Web Logic Server jar and Service Bus zip files to roles/ansible-role-oracle-osb11g/files/
  * Modify main-vars.yml if needed
- [Eclipse](https://eclipse.org/) and [SoapUI](https://www.soapui.org/)
  * You can "accelerate" the provisioning by downloading Eclipse and SoapUI archives to roles/ansible-role-development-environment/files/

## Vagrant 

```
# start virtual server and install all required sw
vagrant up
```

```
# reload virtual server to properly activate GUI
vagrant reload
```

## GUI Username/password
```
Username: vagrant
Password: vagrant
```

## Web Logic console
```
Open Web Console in your web browser
http://127.0.0.1:7001/console
Login
Username: weblogic
Password: welcome1
Login
```

## Oracle Service Bus console

```
Open Web Console in your web browser
http://127.0.0.1:7001/sbconsole
Login
Username: weblogic
Password: welcome1
Login
```

## Vagrant base box

Following list of commands exports the virtual machine as a Vagrant base box. It can be imported to any local Vagrant instance.

```
# login to vagrant machine
vagrant ssh

# clean
sudo apt-get clean
sudo rm -rf /tmp/*
# zero drive
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
# clean history
cat /dev/null > ~/.bash_history && history -c && exit

# generate base box and save as a file
vagrant package --output ansible-playbook-oracle-osb11g.box
```

```
# add box to vagrant
vagrant box add ansible-playbook-oracle-osb11g ansible-playbook-oracle-osb11g.box
```

```
# use box 
vagrant init ansible-playbook-oracle-osb11g
vagrant up
```