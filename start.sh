sudo apt-get update
sudo apt-get install python3 python3-pip git -y
git clone https://github.com/dinisusmc/docker_deploy.git
cd docker_deploy/
sudo pip3 install -r requirements.txt
sudo python3 backend.py