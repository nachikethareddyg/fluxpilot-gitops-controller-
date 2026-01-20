# FluxPilot: GitOps-Driven Multi-Cloud Deployment Controller

## Overview
FluxPilot is a GitOps-based DevOps project that demonstrates how Kubernetes
clusters and applications can be continuously managed using Git as the
single source of truth.

The project showcases modern DevOps practices such as declarative
infrastructure, automated synchronization, and environment-based
configuration management.

---

## Architecture (High Level)
- GitHub repository acts as the source of truth
- FluxCD continuously monitors repository changes
- Cluster configuration is applied from `clusters/dev`
- Application manifests are managed under `apps/sample-app`

---

## Project Structure
