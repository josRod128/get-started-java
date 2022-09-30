FROM websphere-liberty:microProfile
COPY server.xml /config/
RUN mvn clean install
ADD target/GetStartedJava.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/
run docker build -t getstartedjava:latest .
run docker tag getstartedjava:latest gcr.io/serverless-java-started/getstartedjava:latest
run docker push gcr.io/serverless-java-started/getstartedjava:latest
ENV LICENSE accept
EXPOSE 9080

## Running the container locally
# docker run -d --name myjavacontainer getstartedjava
# docker run -p 9080:9080 --name myjavacontainer getstartedjava
# Visit http://localhost:9080/GetStartedJava/

## Push container to IBM Cloud
# ibmcloud ic images # Verify new image
