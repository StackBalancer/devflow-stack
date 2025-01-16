# devflow-stack
Project designed to showcase a wide range of DevOps skills. It integrates infrastructure automation, continuous integration (CI), and continuous deployment (CD) practices, demonstrating how modern DevOps tools and methodologies can streamline software development workflows.

# Tech Stack
Jenkins

Docker

Make

Prometheus

Grafana

Python

# Create Docker network bridge
```bash
  make docker-network
```

# Install Jenkins
1. Run Jenkins instance:
```bash
  make jenkins-master
```

1. Access Jenkins at http://localhost:8080 in your web browser

2. Get Jenkins password and use it for initial login:

```bash
  JENKINS_CONTAINER_ID=$(docker ps -a --filter "ancestor=jenkins/jenkins:lts" --format "{{.ID}}")
  docker exec -it <JENKINS_CONTAINER_ID> /bin/bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
```

4. Jenkins agent
- Configure jenkins agent node - https://hub.docker.com/r/jenkins/inbound-agent
- Build custom Docker container with Python installed:
```bash
  make jenkins-agent-build
```
- Run agent container (replace \<secret-id\> in Makefile with one displayed in status window)
```bash
  make jenkins-agent
```

# Install Prometheus
Run Prometheus container:
```bash
  make prometheus
```

## Expose Jenkins Metrics with the Prometheus plugin

Configure Prometheus for Jenkins:

- Go to Manage Jenkins > Manage Plugins > Available plugins

- Search for and install the Prometheus Metrics Plugin.

Configure the plugin:

- Go to Manage Jenkins > Configure System

- Enable the Prometheus metrics endpoint in Jenkins (e.g. http://localhost:8080/prometheus).

Verify Prometheus Scraping:

- Open Prometheus at http://localhost:9090
- Navigate to Status → Targets

You should see the Jenkins job metrics under jenkins-master:8080.

# Install Grafana
- Run Grafana in a Docker Container:
```bash
  make grafana
```
- Access Grafana in your local browser http://localhost:3000 (admin/admin).
- Add Prometheus as a Data Source, Settings > Data Sources > Add data source - select Prometheus.
- Configure the following -> URL: http://prometheus:9090 (replace prometheus with the container name or service name of Prometheus).
  