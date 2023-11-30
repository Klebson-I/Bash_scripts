docker container run --publish 80:80 -d --name nginx_container nginx
docker container run --publish 8080:80 -d --name httpd_container httpd
docker container run --publish 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=yes -d --name mysql_container mysql