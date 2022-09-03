# docker login to nexus


echo '{
  "insecure-registries": [
     "http://3.238.16.132:8081",
     "http://3.238.16.132:8082"
  ]
}' > ~/daemon.json
sudo mv ~/daemon.json /etc/docker/

sudo systemctl daemon-reload
sudo systemctl restart docker

touch ~/my_password.txt
echo "admin123" > ~/my_password.txt
cat ~/my_password.txt | sudo docker login http://3.238.16.132:8082 --username admin --password-stdin

# tag and push to nexus

sudo docker tag feb5d9fea6a5 3.238.16.132:8082/hello-world:mytag

sudo docker push 3.238.16.132:8082/hello-world:mytag

sudo docker pull  3.238.16.132:8081/hello-world:mytag
