
docker run -d --privileged=true --name ampere -v /work:/work2 -p 40005:22 -p 85:80 -p 8085:8080 -p 9105:9100 -p 3005:3000 -p 9095:9090 -p 8005:8000 -P bmcmonitor
# docker run -d --privileged=true --name bmcmonitor -v /work:/work -p 40001:22 -p 81:80 -p 8080:8080 -p 9100:9100 -p 3000:3000 -p 9090:9090 -p 8000:8000 -P ubuntu1804arm64
docker update --restart=unless-stopped ampere
