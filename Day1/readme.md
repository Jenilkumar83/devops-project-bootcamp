# Retail Store Sample UI - Docker Practical

## Introduction

* Retail store microservices application
* Multi-Container Application – 5 microservices, 3 DBs, 1 cache server, 1 messaging server
* Self-hosted persistent dataplane on AWS EKS cluster
* Multi-stage docker builds
* AWS VPC with public and private subnets
* Precedence of terraform variables
* Terraform remote state datasource
* EKS Pod Identity Agent (PIA), Kubernetes storage, AWS EBS volumes for EKS workloads
* AWS Secrets Manager for EKS workloads + RDS MySQL DB
* AWS Load Balancer Controller install on AWS EKS
* Helm – Kubernetes package manager
* Load balancers & DNS
* Spot nodepool + interruption handling + pod disruption budget
* Horizontal Pod Autoscaler (HPA)
* EKS cluster + metrics server using Terraform
* ADOT - AWS Distro for Open Telemetry
* AWS DevOps CI/CD: GitOps pipeline
* What is ArgoCD?

---

## Section 1: Retail Store Project Introduction

* 5 microservices, 3 DBs, 1 cache server, 1 messaging server
* Total 10 containers

---

## Section 2: Docker Commands

### Docker on Amazon Linux 2023

```bash
sudo dnf update -y
sudo dnf install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
```

### Local (WSL / Ubuntu)

```bash
sudo apt update
sudo apt install docker.io
docker --version
sudo usermod -aG docker $USER
newgrp docker
sudo service docker start
```

Screenshot:
![alt text](images/image.png)

---

## Docker Basic Commands

```bash
docker images
docker ps
docker ps -a
docker ps -aq
docker rm $(docker ps -aq)
docker images -q
docker rmi $(docker images -q)
```
![alt text](images/image-25.png)

![alt text](images/image-24.png)
---

## Check Docker Version

```bash
docker version
```

---

## Pull Docker Image

```bash
docker pull stacksimplify/retail-store-sample-ui:1.0.0
```
### Alternatively (GitHub Packages)

```bash
docker pull ghcr.io/stacksimplify/retail-store-sample-ui:1.0.0
```
![alt text](images/image-23.png)
---

## Run Docker Container

```bash
docker run --name app1 -p 8888:8080 -d stacksimplify/retail-store-sample-ui:1.0.0
```

* `-d` → detach mode
* `8080` → container port
* `8888` → host port

Screenshot:
![alt text](images/image-22.png)
---

## Application Output

Open in browser:

```
http://localhost:8888
```

Screenshot:
![alt text](images/image-21.png)
---

## Execute Commands Inside Container

```bash
docker exec -it app1 /bin/sh
docker exec -it app1 ls
docker exec -it app1 env
```

Screenshot:
![alt text](images/image-19.png)

![alt text](images/image-20.png)

![alt text](images/image-18.png)

![alt text](images/image-17.png)

---

## Container Management

```bash
docker stop app1
docker start app1
docker rm app1
docker rmi <image-id>
```
![alt text](images/image-16.png)

---

## Build Docker Image

```bash
docker login
mkdir demo-docker-build
cd demo-docker-build
wget https://github.com/aws-containers/retail-store-sample-app/archive/refs/tags/v1.4.2.zip
unzip v1.4.2.zip
```
![alt text](images/image-15.png)

![alt text](images/image-14.png)
---

## Modify Application Code

```bash
sed -i 's/Secret Shop<\/span>/No more Secret Shop<\/span>/' home.html
grep 'Secret Shop' home.html
```
![alt text](images/image-13.png)
---

## Build Docker Image

```bash
docker build -t retail-store-sample-ui:2.0.0 .
```

Screenshot:
![alt text](images/image-12.png)

---

## Tag and Push to Docker Hub

```bash
docker tag retail-store-sample-ui:2.0.0 jenil83/devops-project-bootcamp:2.0.0
docker push jenil83/devops-project-bootcamp:2.0.0
```

Screenshots:
![alt text](images/image-11.png)

### Before Change

![alt text](images/image-9.png)
### After Change

![alt text](images/image-10.png)
---

## Summary

* Installed Docker locally and on EC2
* Pulled and ran container
* Accessed application on browser
* Executed commands inside container
* Built custom Docker image
* Tagged and pushed image to Docker Hub

---
