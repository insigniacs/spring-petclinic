FROM maven:4.9.3-eclipse-temurin-17
LABEL author="Nadeem" organization="Insignia"
RUN apt update
RUN java -version
RUN git clone https://github.com/insigniacs/spring-petclinic.git
RUN cd /spring-petclinic
RUN mvn --version
RUN mvn -f /spring-petclinic/pom.xml package
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar"]                                                                                           