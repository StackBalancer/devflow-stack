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

.PHONY: docker-network jenkins-master jenkins-agent-build jenkins-agent
