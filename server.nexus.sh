# install docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce
sudo docker --version

# pull nexus 
sudo docker pull hoso30/nexus:nexusv1
sudo docker run -d -p 8081:8081 -p 8082:8082 hoso30/nexus:nexusv1