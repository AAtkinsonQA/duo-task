#! /bin/bash

ssh -i /var/lib/jenkins/.ssh/id_rsa lukewestside14@104.198.74.158 << EOF
sudo docker pull lukebenson1/flask-app:1.0
sudo docker run -d -p 5000:5000 --name flask-app lukebenson1/flask-app:1.0
git clone https://github.com/LukeBenson/duo-task.git
sudo docker run -d -p 80:80 --mount type=bind,source=./duo-task/nginx.conf,target=/etc/nginx/nginx.conf --name nginx nginx:latest
EOF
