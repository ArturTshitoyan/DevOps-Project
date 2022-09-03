# install pip3
sudo apt-get update
sudo apt-get -y install python3-pip
pip3 install requests
pip3 install --upgrade requests
pip3 --version

# install nexus3-cli
pip install nexus3-cli

# add path for using nexus3
export PATH="/home/ubuntu/.local/bin:$PATH"

# install docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce
sudo docker --version


# add repository to nexus

echo '{
  "insecure-registries": [
     "http://3.238.16.132:8081",
     "http://3.238.16.132:8082"
  ]
}' > ~/daemon.json
sudo mv ~/daemon.json /etc/docker/

sudo systemctl daemon-reload
sudo systemctl restart docker

nexus3 login -U  http://54.167.12.24:8081 -u admin -p admin123 --no-x509_verify
nexus3 repository create hosted docker --http-port 8082 hoso
nexus3 security realm activate DockerToken





