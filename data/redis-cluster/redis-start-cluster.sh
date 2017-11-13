supervisord -c /etc/supervisor.d/redis.ini
sleep 5

file="/src/redis-master-1/dump.rdb"
if [ -f "$file" ]
then
    tail -f /src/redis-master-1/redis-master-1.log
else
    IP=`ifconfig | grep "inet addr:17" | cut -f2 -d ":" | cut -f1 -d " "`
    echo "yes" | ruby /usr/bin/redis-trib.rb create --replicas 1 ${IP}:6379 ${IP}:6380 ${IP}:6381 ${IP}:6382 ${IP}:6383 ${IP}:6384 >> /src/redis-cluster.log
    tail -f /src/redis-cluster.log
fi