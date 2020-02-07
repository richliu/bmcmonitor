

monitor Ampere CPU's BMC status 

# Docker

## Install docker on host

$ sudo apt install docker.io
$ sudo systemctl enable docker

## Start Docker Daemon 

cd script
execute script "start_docker.sh"
$ bash start_docker.sh


# Telegraf 

## output 

sensor value can be write into /work/output/in_temp_input and in_humidityrelative_input
in_temp_input is current temperature value
in_humidityrelative_input is current humidity value

