sudo apt-get update
sudo apt-get install python3 python3-pip git -y
git clone https://github.com/dinisusmc/multi_service_automation.git
cd multi_service_automation/
sudo pip3 install -r requirements.txt
python3 backend.py