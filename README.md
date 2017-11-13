Local Redis Cluster
=======================

1) Build the local redis-cluster image:
```bash
docker build -f Dockerfile.redis -t local-redis-cluster .
```

2) Create docker network 'webnet'
```bash
docker network create --driver=bridge --subnet=172.19.0.0/16 --gateway=172.19.0.1 webnet
```

3) Start the cluster using docker-compose
```bash
docker-compose up
```

4) Connect to the redis cluster
```bash
telnet 127.0.0.1 7000
```