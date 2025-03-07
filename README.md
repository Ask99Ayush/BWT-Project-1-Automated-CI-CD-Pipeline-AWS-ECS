# Automated CI/CD Pipeline for Scalable Microservices Deployment using Jenkins & AWS ECS

 🧑‍💻Problem Statement

Manual deployment processes are time-consuming, error-prone, and inefficient for scaling microservices. Managing containerized applications manually on AWS ECS introduces delays and inconsistencies. There is a need for a fully automated CI/CD pipeline that ensures **fast, reliable, and scalable deployments**.

🎯 Solution Overview

This project implements an Automated CI/CD Pipeline using Jenkins, AWS ECS, AWS ECR, and GitHub. The pipeline ensures that whenever a developer pushes code to GitHub, the new version is automatically built, containerized, and deployed to AWS ECS with zero downtime.

 🏗 Architecture Diagram
![image](https://github.com/user-attachments/assets/612b1b18-7636-4d2b-aff6-cf5e971c2797)


  Tech Stack & Tools Used

- Jenkins - CI/CD automation tool
- Docker - Containerization of microservices
- AWS ECS (Elastic Container Service) - Managed container orchestration
- AWS ECR (Elastic Container Registry) - Secure image storage
- AWS ALB (Application Load Balancer) - Load balancing and routing
- GitHub - Source code management & webhooks
- Webhooks - Triggering CI/CD pipeline automatically

 Setup & Installation

 Prerequisites
- AWS account with IAM permissions
- Jenkins server installed and configured
- GitHub repository setup
- Docker installed locally

Step-by-Step Setup
1. Clone the Repository
   ```sh
   git clone https://github.com/Kunalkthalautiya/Project-1-Automated-CI-CD-Pipeline-AWS-ECS.git
   cd Automated-CI-CD-Pipeline
   ```
2. Set up AWS ECS Cluster & Task Definition
3. Configure AWS ECR for storing Docker images
4. Set up Jenkins with required plugins
5. Create a Jenkins Pipeline Script (Jenkinsfile)
6. Configure Webhook in GitHub
7. Test the Pipeline with Code Push

🔄 CI/CD Pipeline Workflow

1. Developer Pushes Code - Developer commits & pushes code to GitHub.
2. Webhook Triggers Jenkins - GitHub webhook notifies Jenkins.
3. Jenkins Pulls Code & Builds Docker Image
4. Pushes Docker Image to AWS ECR
5. Updates ECS Task Definition & Restarts ECS Service
6. AWS ALB Routes Traffic to Updated Microservice
7. User Accesses the Updated Microservice

 📂 Project Structure
```
├── src/                # Application source code
├── Dockerfile          # Docker image setup
├── Jenkinsfile         # CI/CD pipeline script
├── deployment/         # ECS deployment configs
└── README.md           # Documentation
```

 ✅ Key Features
- Fully Automated CI/CD Pipeline - No manual deployments
- Zero Downtime Deployments - Ensures smooth updates
- Scalable Architecture - Supports multiple microservices
- Secure Image Storage in AWS ECR
- AWS ALB for Load Balancing & Routing

💡 Future Enhancements
- Implement GitHub Actions as an alternative to Jenkins
- Add ArgoCD for GitOps-based deployments
- Use Helm Charts for Kubernetes-based deployment

🙌 Contributions & Support
Contributions are welcome! Feel free to fork, create issues, or submit PRs.

 ⭐ Star the Repository if You Found It Useful!
