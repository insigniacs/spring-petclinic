FROM maven:3.9.5-eclipse-temurin-17
LABEL author="Nadeem" organization="Insignia"
RUN apt update && apt install openjdk-17-jdk -y
RUN echo "export PATH="$PATH:/usr/share/maven/apache-maven-3.9.5/bin" >> /home/ubuntu/.bashrc"
RUN git clone https://github.com/insigniacs/spring-petclinic.git
RUN cd spring-petclinic
RUN mvn package
ADD /target/spring-petclinic-3.1.0-SNAPSHOT.jar /spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic-3.1.0-SNAPSHOT.jar"]