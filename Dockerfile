FROM hub.c.163.com/xbingo/jdk8
ADD ./target/web-boot-0.0.1.jar /web-boot.jar
EXPOSE 8080
CMD ["java","-jar","/web-boot.jar"]