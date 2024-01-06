# NGINX Ingress Controller Communication Flow

This document details the communication flow from the Public Endpoint to the target pod through the NGINX Ingress Controller in a Kubernetes environment.

## Communication Flow

1. **Public Endpoint (Load Balancer):**
   - External traffic is initially directed to the Public Endpoint, typically a Load Balancer.

2. **NGINX Ingress Controller Pod:**
   - Incoming requests are forwarded to the NGINX Ingress Controller pod(s).

3. **NGINX Ingress Controller (nginx-ingress):**
   - The NGINX Ingress Controller processes requests, reads Ingress resources from the Kubernetes API, and dynamically adjusts its configuration.

4. **Kubernetes API:**
   - Communication with the Kubernetes API ensures the NGINX Ingress Controller stays updated on Ingress resources and other related Kubernetes objects.

5. **NGINX Configuration Generation:**
   - Dynamic generation of NGINX configurations based on Ingress resources, involving the creation or update of configuration files and handling TLS certificates.

6. **NGINX Worker Processes:**
   - NGINX Ingress Controller spawns worker processes to handle incoming traffic, acting as a reverse proxy.

7. **HTTP/HTTPS Traffic Handling:**
   - NGINX worker processes handle incoming HTTP or HTTPS traffic, forwarding requests to the appropriate backend services.

8. **Layer 7 Load Balancing:**
   - Layer 7 load balancing, if configured, ensures traffic is distributed based on rules defined in Ingress resources.

9. **Service Discovery:**
   - Interaction with Kubernetes Service, Endpoint, and Pod objects to discover backend services and pods.

10. **Backend Pods:**
    - Finally, traffic reaches the target backend pods hosting the application services.

## Visualization

[Public Endpoint] --> [NGINX Ingress Controller Pod] --> [Kubernetes API] --> [NGINX Configuration Generation] -->
[NGINX Worker Processes] --> [Service Discovery] --> [Backend Pods]
