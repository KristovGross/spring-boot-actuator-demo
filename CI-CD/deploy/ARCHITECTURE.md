# Arquitectura de la solución

## Objetivo

La solución implementa un proceso DevOps para una aplicación Spring Boot utilizando Docker, GitHub Actions, Terraform y una arquitectura AWS basada en ECS Fargate.

Se diseñaron tres ambientes:

- DEV
- QA
- PROD

La infraestructura AWS se encuentra definida mediante Infrastructure as Code, pero no se mantiene aprovisionada para evitar costos en mi cuenta de AWS.

---

## Flujo CI/CD

```mermaid
flowchart LR
    DEV[Developer] --> GIT[Git Repository]
    GIT --> PR[Pull Request]

    PR --> CI[GitHub Actions CI]

    CI --> TEST[Maven Tests]
    CI --> BUILD[Docker Build]
    CI --> SECURITY[Trivy Scan]

    TEST --> MASTER[master]
    BUILD --> MASTER
    SECURITY --> MASTER

    MASTER --> CD[GitHub Actions CD]

    CD --> VALIDATE[Terraform Validate]
    CD --> PREVIEW[Deployment Preview]

    PREVIEW -->|deploy=false| STOP[No AWS changes]

    PREVIEW -->|deploy=true| OIDC[AWS OIDC]
    OIDC --> ECR[Amazon ECR]
    ECR --> ECS[Amazon ECS Fargate]