gcloud compute firewall-rules create open-5001 --allow tcp:5001
gcloud compute firewall-rules create open-5002 --allow tcp:5002
gcloud compute instances create automato \
    --zone=us-east4-c \
    --metadata-from-file=startup-script=./start.sh

