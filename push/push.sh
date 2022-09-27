#! /bin/sh

echo *********************
echo
echo ---PUSHING IMAGE-----
echo
echo *********************

IMAGE="maven_project"
PASS="abhay&mitsogo"
echo **** LOGGING IN *****
docker login -u abhaymitsogo -p $PASS
echo TAGGING IMAGE
docker tag $IMAGE    abhaymitsogo/$IMAGE:$BUILD_TAG
echo PUSHING IMAGE abhaymitsogo/$IMAGE:$BUILD_TAG
