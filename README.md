# springboot-test
Jenkins+docker持续集成SpringBoot项目测试实例

Jenkins构建命令
---------------
cd $WORKSPACE

##清理并打包,跳过测试
mvn clean
mvn package -Dmaven.test.skip=true  

##删除容器
if docker ps -a | grep -i springboot-test ; then
	docker rm -f springboot-test
fi
#删除镜像
if docker images | grep -i springboot-test ; then
	docker rmi springboot-test:0.1
fi
#重新构建镜像
docker build -t springboot-test:0.1 .
#启动容器
docker run -d -p 8082:8080 --name springboot-test springboot-test:0.1

```
