# DevOps Task - CI/CD Pipeline with AWS ECS

## Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture Diagram](#architecture-diagram)
3. [Setup Instructions](#setup-instructions)
4. [Pipeline Flow](#pipeline-flow)
5. [Monitoring & Logging](#monitoring--logging)
6. [Deployment Proof](#deployment-proof)
7. [Tools & Services Used](#tools--services-used)
8. [Challenges & Solutions](#challenges--solutions)
9. [Possible Improvements](#possible-improvements)

---

## Project Overview
This project demonstrates a **complete CI/CD pipeline** for a Node.js application using:

- **Source Control:** GitHub  
- **CI/CD:** Jenkins  
- **Containerization:** Docker  
- **Cloud Deployment:** AWS ECS Fargate  
- **Infrastructure as Code:** Terraform  
- **Monitoring & Logging:** AWS CloudWatch  

The pipeline automates the process of building, testing, containerizing, pushing, and deploying the application, following DevOps best practices.

---

## Architecture workflow


> Diagram shows the flow: GitHub → Jenkins → Docker → AWS ECR → ECS Fargate → CloudWatch Monitoring

---
## Deployment Proof

- Screenshots (included in repository `image/` folder) showing:
  - Jenkins pipeline successful build
  - ECS service running
  - CloudWatch logs streaming
> Note: I have created a folder named `Image` in the repository containing all relevant screenshots.






## Setup Instructions

### Prerequisites
- AWS account with permissions for ECS, ECR, VPC, IAM, and CloudWatch  
- Docker installed locally  
- Terraform installed  
- Jenkins server setup  

### Steps

1. **Clone Repository**
```bash
git clone <https://github.com/patelharsh06/devops-task.git>
cd devops-task
