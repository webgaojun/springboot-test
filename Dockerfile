FROM hub.c.163.com/xbingo/jdk8
ADD ./target/springboot-test-0.1.jar  /springboot-test-0.1.jar
EXPOSE 8080
CMD ["java","-jar","/springboot-test-0.1.jar"]