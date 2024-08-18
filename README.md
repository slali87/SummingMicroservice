# SummingMicroservice
A Go microservice that computes and returns the sum of two numbers.  
The repository also includes an index.html file so that the API can be used through a graphical interface.

### **Commands of local use (dev version):**
```
make build
make run
curl "127.0.0.1:8081/sum?a=1&b=4"               # For testing
google-chrome "127.0.0.1:8081/sum?a=1&b=4"      # For testing
google-chrome "127.0.0.1:8081"                  # For testing (GUI)
```

### **Commands of local Docker use (dev version):**
```
make local-docker-build
make local-docker-run
curl "0.0.0.0:8081/sum?a=1&b=4"             # For testing
google-chrome "0.0.0.0:8081/sum?a=1&b=4"    # For testing
google-chrome "0.0.0.0:8081"                # For testing (GUI)
```

### **Commands of GCloud use (staging version):**
```
export ENVIRONMENT=staging
export GCP_PROJECT_ID=<YOUR GCP PROJECT ID>      # Replace the <YOUR GCP PROJECT ID> !!!
make gcloud-docker-init                          # This only needs to be run once !
make gcloud-docker-build
make gcloud-docker-push                          # This pushes the docker image into the GCloud's Container Registry
make gcloud-run-deploy                           # This deployes the pushed docker image into the GCloud's Cloud Run
google-chrome "https://<LINK PROVIDED BY GCLOUD'S CLOUD RUN>/sum?a=1&b=4"   # For testing
google-chrome "https://<LINK PROVIDED BY GCLOUD'S CLOUD RUN>"               # For testing (GUI)
```

### **Commands of GCloud use (production version):**
```
git push origin main    # This delivers the changes to GitHub main and the GitHub Actions builds, pushes and deployes it to GCloud.
google-chrome "https://<LINK PROVIDED BY GCLOUD'S CLOUD RUN>/sum?a=1&b=4"   # For testing
google-chrome "https://<LINK PROVIDED BY GCLOUD'S CLOUD RUN>"               # For testing (GUI)
```

Based on https://github.com/SanFranciscobolJottem/penguin-api
