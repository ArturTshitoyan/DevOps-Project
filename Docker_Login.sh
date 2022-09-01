# docker login to nexus
touch ~/my_password.txt
echo "admin123" > ~/my_password.txt
cat ~/my_password.txt | sudo docker login http://54.167.12.24:8082 --username admin --password-stdin
