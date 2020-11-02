#! /bin/bash

ssh -i /var/lib/jenkins/.ssh/id_rsa lukewestside14@104.198.74.158 << EOF
sudo docker pull lukebenson1/flask-app:1.0
if [ $(docker ps -a | grep flask-app) ]; then
  sudo docker rm -f flask-app
fi
sudo docker run -d -p 5000:5000 --name flask-app lukebenson1/flask-app:1.0
if [ -d duo-task ]; then
  rm -rf duo-task
fi
git clone https://github.com/LukeBenson/duo-task.git
if [ $(docker ps -a | grep nginx) ]; then
  sudo docker rm -f nginx
fi
sudo docker run -d -p 80:80 --mount type=bind,source=/home/lukewestside14/duo-task/nginx.conf,target=/etc/nginx/nginx.conf --name nginx nginx:latest
EOF
