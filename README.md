# Deploying an app onto Google Kubernetes 

## **You must update the IP address in todolist.py to reflect which ever IP your api is on**

## Clone this repository;
https://github.com/dinisusmc/docker_deploy.git


## create docker image repository in gke
gcloud artifacts repositories create flask-ims \                                                               
    --project=cisc5550-430923 \
    --repository-format=docker \
    --location=us-east4 \
    --description="Docker repository"


## Build image on gke;
gcloud builds submit \
  --tag us-east4-docker.pkg.dev/cisc5550-430923/flask-ims/gunicorn-gke ./docker_deploy.zip


## create a gke cluster
gcloud container clusters create-auto gunicorn-gke \
  --location us-east4

## check if you have access to cluster
kubectl get nodes

## Deploy app to cluster with yaml
kubectl apply -f deployment.yaml

## Check that the pod was created
kubectl get pods

## Run service to have a central ip for all pods within the cluster
kubectl apply -f service.yaml

## run this to get the ip address for cluster
kubectl get services



# When Finished run these to delete resources

## Delete Clusters
gcloud container clusters delete gunicorn-gke \
    --location us-east4

## Delete Images
gcloud artifacts docker images delete \
    us-east4-docker.pkg.dev/cisc5550-430923/flask-ims/gunicorn-gke