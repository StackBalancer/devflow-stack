# Create Docker bridge network
docker-network:
	docker network create jenkins-network

# Start Jenkins
jenkins-master:
	docker run -d --name=jenkins-master --network jenkins-network -p 8080:8080 -p 50000:50000 -v ~/jenkins_home:/var/jenkins_home jenkins/jenkins:lts

# Build Jenkins-agent
jenkins-agent-build:
	docker build -t jenkins-agent ./jenkins/agent/

# Start Jenkins agent
jenkins-agent:
	docker run -d --name jenkins-agent --network jenkins-network -e JENKINS_URL=http://jenkins-master:8080 -e JENKINS_AGENT_NAME=jenkins-agent -e JENKINS_SECRET=<secret-id> jenkins-agent

# Start Prometheus
prometheus:
	docker run -d --name prometheus --network jenkins-network -p 9090:9090 -v $(pwd)/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus

# Start Grafana
grafana:
	docker run -d --name=grafana --network=jenkins-network -p 3000:3000 grafana/grafana

.PHONY: docker-network jenkins-master jenkins-agent-build jenkins-agent prometheus grafana

