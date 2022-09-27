#! bin/sh

# copy the new jar to build location

cd /home/mitsuser/jenkins/jenkins-data/pipeline

cp -f java-app/target/*.jar build/

echo ***************************************
echo
echo _________BUILDING JAR__________________
echo
echo ***************************************

cd build/

docker compose -f docker-compose-build.yml build --no-cache

# done.