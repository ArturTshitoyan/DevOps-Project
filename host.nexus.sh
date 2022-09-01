# install pip3
sudo apt-get update
sudo apt-get -y install python3-pip
pip3 --version

# install nexus3-cli
pip install nexus3-cli

# add path for using nexus3
export PATH="/home/ubuntu/.local/bin:$PATH"

# add repository to nexus
nexus3 repository create hosted docker --http-port 8082 hoso
nexus3 security realm activate DockerToken
touch /etc/docker/daemon.json
echo '{
  "insecure-registries": [
     "http://18.209.5.62:8081",
     "http://18.209.5.62:8082"
  ]
}' > /etc/docker/daemon.json


# install docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce
sudo docker --version



# docker login to nexus
touch ~/my_password.txt
echo "admin123" > ~/my_password.txt
cat ~/my_password.txt | docker login http://54.167.12.24:8082 --username admin --password-stdin
