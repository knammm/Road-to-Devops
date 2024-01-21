# Kubernetes

Kubernetes provides a platform for automating the deployment, scaling, and operations of application containers across clusters of hosts. It was originally developed by Google and is now maintained by the Cloud Native Computing Foundation (CNCF).

## Kubernetes Provides
- **Service Discovery and Load Balancing:** Kubernetes automatically manages the discovery and routing of services within the cluster, ensuring efficient load balancing and seamless communication between microservices.
- **Storage Orchestration:** Kubernetes offers dynamic storage provisioning and management, allowing applications to request and use storage resources as needed. It simplifies the process of managing persistent data for containerized applications.
- **Automated Rollouts and Rollbacks:** Kubernetes enables automated deployment of application updates and rollbacks in case of issues. This ensures a smooth and controlled release process, enhancing the reliability of applications.
- **Automatic Bin Packing:** Kubernetes optimizes resource utilization by automatically placing containers based on their resource requirements and constraints. This efficient bin packing strategy enhances overall cluster efficiency.
- **Self-healing:** Similar to Auto Scaling Groups (ASGs), Kubernetes ensures the self-healing of applications by automatically replacing failed containers or rescheduling them to healthy nodes. This proactive approach enhances the reliability and availability of applications.
- **Secret and Configuration Management:** Kubernetes provides a secure and centralized way to manage sensitive information such as passwords, API keys, and configuration settings. It helps in keeping the application configurations and secrets separate from the application code.

## Master: Kube API Server
- `Main Hero!` handles all the requests and enables communication across stack services. And then it is going to pass the infomation to other services like scheduler, etcd and worker nodes.
- Component on the master that exposes the Kubernetes API.
- It is the front-end for the Kubernetes control plane.
- Admins connect to it using `kubectl`.
- Web Dashboard can be integrated with this API.

## Master: ETCD Server
- Store all the information.
- Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.
- KubeAPI stores and retrieves information from it.
- Should be backed up regularly.
- Stores current state of everything in the cluster.

## Master: Kube Scheduler
- Watches newly created pods that have no node assigned, and selects a node for them to run on.
- Factors taken into account for scheduling decisions include:
  - individual and collective resource requirements.
  - hardware/software/policy contrains.
  - affinity and anti-affinity specifications.
  - data locality.
  - inter-workload interference and deadlines.
 
## Master: Controller Manager
- Logically, each controller is a separated process.
- To reduce the complexity, they are all compiled into a single binary and run in a single process.
- **Node controller:** Responsible for noticing and responding when nodes go down.
- **Replication controller:** Responsible for maintaining the correct number of pods for every replication controller object in the system.
- **Endpoints controller:** Populates the Endpoints object (join services & pods).
- **Service Account & Token Controller:** Create default accounts and API access tokens for new namespace.
