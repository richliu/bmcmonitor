

bmcmonitor : Monitor Ampere CPU's BMC status 


# Hardware Requirement 

bmcmonitor runs on ARM64 platform like Ampere eMAG or QuickSliver Platform
Should be also ok on Raspberry Pi 4.

If wants to run on x86 platform, please modify dockerfile to build x86 docker image 

# Install docker on host

bmcmonitor provided a prebuild docker image and dockerfile for you to customize it. 
whatever run it directly or build it, it needs install docker first 

$ sudo apt install docker.io
$ sudo systemctl enable docker

# Run bmcmonitor on docker 

It can use prebuild docker image from richliu/bmcmonitor, following is example command to start daemon 
$ docker run -d --privileged=true --name ampere -v /work:/work2 -p 3005:3000 -p 9095:9090 -P richliu/bmcmonitor

--name docker container name, we use ampere here
-v means mapping outside /work into /work2 , do not map into /work, it's image's default work directory. 
-p 3005:3000 Grafana daemon port 
   mapping internal 3000 port to outside 3005, it can be changed accordingly to your environment 
-p 9095:9090 Prometheus daemon port 
   mapping internal 9090 port to outsize 9095, good for debug to know the Prometheus current status. 

if you wants to use local build image, command should be use -P bmcmonitor , 
ex:
$ docker run -d --privileged=true --name ampere -v /work:/work2 -p 3005:3000 -p 9095:9090 -P richliu/bmcmonitor

# Change data source 

bmcmonitor uses telegraf to fetch all Ampere BMC's information , there are some default server but may not fit your
environment. 

After run bmcmonitor docker image, please use follow command to run docker image's shell
$ docker exec -it ampere /bin/bash 
root@[dockerid]# vim /etc/telegraf/telegraf.conf

around line 2674
	servers = ["ADMIN:ADMIN@lan(192.168.110.250)", "ADMIN:ADMIN@lan(192.168.110.251)", "ADMIN:ADMIN@lan(192.168.110.252)", "ADMIN:ADMIN@lan(192.168.106.10)", "ADMIN:ADMIN@lan(192.168.110.230)"]
please modify it accordingly. 

After modify the file, it needs to restart telegraf 
$ /etc/init.d/telefraf restart

## telegraf get temperature and humidity output 

default telegraf will read some sensor value from file. 

sensor value can be write into /work/output/in_temp_input and in_humidityrelative_input
in_temp_input is current temperature value
in_humidityrelative_input is current humidity value

it can write yourown  script to fetch from somewhere to get current room temperature and humidity 


# build docker image

build docker image is very easy
$ cd docker 
$ bash build.sh 

it will create a docker image name bmcmonitor
