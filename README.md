<p align="center">
    <h1 align="center">GKE CI/CD Application</h1>
</p>

<p align="center">
A complete end-to-end DevOps pipeline using <b>GCP Cloud Build</b>, <b>GKE</b>, <b>Artifact Registry</b>, and <b>Terraform</b> to deploy a Dockerized Flask application into Kubernetes — fully automated from code push to deployment.
</p>

<br>

##  Table of Contents

- [ Overview](#-overview)
- [ Features](#-features)
- [ Architecture](#-architecture)
- [ CI/CD Flow](#-cicd-flow)
- [ Project Structure](#-project-structure)
  - [ Project Index](#-project-index)
- [ Getting Started](#-getting-started)
  - [ Prerequisites](#-prerequisites)
- [ Project Roadmap](#-project-roadmap)

---

##  Overview

This project demonstrates a real-world **GCP DevOps production workflow**, showing how an application moves from:

> **Developer → GitHub → Cloud Build → Artifact Registry → GKE → Live URL**

This includes:

- A containerized Flask application  
- Terraform-managed GKE cluster  
- Fully automated CI/CD via Cloud Build triggers  
- Kubernetes Deployments & Services  
- Auto image versioning  
- Production-ready folder structure  

---

##  Features

- 🚀 Fully automated CI/CD using **Cloud Build**
- 🐳 Dockerized Python Flask Application
- 🌐 Public GKE LoadBalancer URL
- 📦 Artifact Registry image versioning
- ☸️ Kubernetes Deployment & Service manifests
- 🧩 Terraform IaC for GKE provisioning
- 🔐 Uses Service Accounts with least-privilege access
- 📊 Can integrate Cloud Monitoring dashboards

---

## Architecture

           ┌────────────────────────┐
           │      Developer         │
           │   (GitHub Push)        │
           └───────────┬────────────┘
                       │
                       ▼
          ┌──────────────────────────┐
          │       Cloud Build        │
          │ 1. Build Docker Image    │
          │ 2. Push to Registry      │
          │ 3. Deploy to GKE         │
          └───────────┬──────────────┘
                       │
                       ▼
         ┌───────────────────────────┐
         │     Artifact Registry     │
         │ Stores versioned images   │
         └───────────┬──────────────┘
                       │
                       ▼
    ┌──────────────────────────────────────┐
    │                  GKE                 │
    │  Deployment → ReplicaSet → Pods      │
    │  Service (LoadBalancer)              │
    └──────────────────┬───────────────────┘
                       │
                       ▼
    ┌──────────────────────────────────────┐
    │        External Load Balancer        │
    │   Public URL → Exposes Flask App     │
    └──────────────────────────────────────┘
## CI/CD Flow

1. Developer pushes code to GitHub
2. Cloud Build is triggered automatically
3. Cloud Build Pipeline:
      - Build Docker image
      - Tag with $SHORT_SHA
      - Push image → Artifact Registry
      - Patch GKE Deployment with new image
4. Kubernetes performs Rolling Update
5. LoadBalancer exposes the updated live application

## Project Structure
<pre>
<code>
└── gke-cicd-app/
    ├── README.md
    ├── app
    │   ├── Cloudbuild.yaml
    │   ├── Dockerfile
    │   ├── app.py
    │   └── k8s
    │       ├── deployment.yaml
    │       └── service.yaml
    └── infra
        └── main.tf
</code>
</pre>

## Project Index
<details open> <summary><b><code>gke-cicd-app/</code></b></summary>
<details>
	<summary><b>infra</b></summary>
	<blockquote>
		<table>
		    <tr>
			    <td><b>main.tf</b></td>
			    <td>Terraform config for provisioning GKE cluster and networking.</td>
		    </tr>
		</table>
	</blockquote>
</details>

<details>
	<summary><b>app</b></summary>
	<blockquote>
		<table>
		    <tr>
			    <td><b>app.py</b></td>
			    <td>Python Flask application.</td>
		    </tr>
		    <tr>
			    <td><b>Dockerfile</b></td>
			    <td>Builds Docker image for Flask app.</td>
		    </tr>
		    <tr>
			    <td><b>Cloudbuild.yaml</b></td>
			    <td>Defines CI/CD pipeline for Cloud Build.</td>
		    </tr>
		</table>
		<details>
			<summary><b>k8s</b></summary>
			<blockquote>
				<table>
				    <tr>
					    <td><b>deployment.yaml</b></td>
					    <td>Kubernetes Deployment definition.</td>
				    </tr>
				    <tr>
					    <td><b>service.yaml</b></td>
					    <td>LoadBalancer Service exposing the application.</td>
				    </tr>
				</table>
			</blockquote>
		</details>
	</blockquote>
</details>
</details>

---

## 🧰 Getting Started

### ✅ Prerequisites

Before using this project, ensure your environment meets the following requirements:

- **Google Cloud Project**
- **Terraform Installed**
- **Docker Installed**
- **gcloud CLI Installed**
- **GKE API Enabled**

---

## 🗺️ Project Roadmap

- [x] **Build Flask App**
- [x] **Dockerize Application**
- [x] **Implement Cloud Build CI/CD**
- [x] **Deploy to GKE**
- [x] **Add monitoring with Prometheus & Grafana**
- [x] **Add Helm chart support**


