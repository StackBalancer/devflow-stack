FROM jenkins/inbound-agent:latest

# Install Python
USER root
RUN apt-get update && apt-get install -y python3 python3-pip

# Switch back to Jenkins user
USER jenkins
