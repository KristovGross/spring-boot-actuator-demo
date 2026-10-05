# DevOps Challenge - Spring Boot Actuator Demo

## 1. Objetivo

Esta implementación agrega prácticas DevOps al proyecto Spring Boot Actuator Demo, incluyendo:

- Containerización con Docker
- Configuración por ambientes
- Observabilidad
- Continuous Integration
- Continuous Deployment
- Infrastructure as Code
- AWS architecture
- Security hardening
- Vulnerability scanning
- Immutable deployments
- Cost-aware infrastructure design

La solución fue diseñada para soportar los ambientes:

- DEV
- QA
- PROD

---

# 2. Arquitectura

## Arquitectura local

```mermaid
flowchart LR
    User[Usuario] --> App[Spring Boot Application]

    App --> Actuator[Spring Boot Actuator]

    Prometheus[Prometheus] -->|Scrape| Actuator

    Docker[Docker Compose] --> App
    Docker --> Prometheus