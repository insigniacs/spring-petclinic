FROM ubuntu:22.04
LABEL author="Nadeem" organization="Insignia"
RUN apt update && apt install openjdk-17-jdk -y
RUN apt install wget -y
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz
RUN mkdir /usr/share/maven
RUN tar -xvzf apache-maven-3.9.3-bin.tar.gz -C /usr/share/maven
RUN echo "export PATH="$PATH:/usr/share/maven/apache-maven-3.9.3/bin" >> /home/ubuntu/.bashrc"
RUN git clone https://github.com/insigniacs/spring-petclinic.git
RUN mvn package
ADD /target/spring-petclinic-3.1.0-SNAPSHOT.jar /spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic-3.1.0-SNAPSHOT.jar"]