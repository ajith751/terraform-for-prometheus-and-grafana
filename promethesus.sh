#!/bin/bash
sudo su
yum install docker -y
systemctl start docker 
systemctl enable docker
sudo mkdir prometheus
sudo tee /home/ec2-user/prometheus/prometheus.yml <<EOF
# my global config
global:
  scrape_interval: 15s
  
scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]
  EOF
docker run -d -p 9090:9090 -v /home/ec2-user/prometheus:/etc/prometheus prom/prometheus
