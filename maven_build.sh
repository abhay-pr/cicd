cd /home/mitsuser/jenkins/jenkins-data/pipeline
docker run --name maven -i --rm -v $PWD/java-app:/app -v /root/.m2:/root/.m2 -w /app  maven:3-alpine $@
