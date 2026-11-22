FROM ubuntu:24.04
RUN apt-get update && apt-get install -y procps hostname && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /root/lab/logs
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
CMD ["bash", "/usr/local/bin/healthcheck.sh"]
