# springboot-test
Jenkins+docker持续集成SpringBoot项目测试实例

Dockerfile
---------------
````
FROM hub.c.163.com/xbingo/jdk8
ADD ./target/springboot-test-0.1.jar  /springboot-test-0.1.jar
EXPOSE 8080
CMD ["java","-jar","/springboot-test-0.1.jar"]
````
Jenkins构建SHELL命令
---------------
```
cd $WORKSPACE
mvn clean
mvn package -Dmaven.test.skip=true
if docker ps -a | grep -i springboot-test ; then
	docker rm -f springboot-test
fi
if docker images | grep -i springboot-test ; then
	docker rmi springboot-test:0.1
fi
docker build -t springboot-test:0.1 .
docker run -d -p 8082:8080 --name springboot-test springboot-test:0.1
```
