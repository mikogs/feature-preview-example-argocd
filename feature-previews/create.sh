#!/bin/bash

name=$1
image=$2

# todo: proper validation would be good
if [[ "$name" == "" ]]; then
    echo "!!! name is missing";
    exit 1;
fi

if [[ "$image" == "" ]]; then
    echo "!!! image is missing";
    exit 2;
fi

mkdir -p fp-$name
cp template/argocd-app/__APP_NAME__.yaml fp-$name.yaml
cp template/base/* fp-$name/

sed -i "s|__APP_NAME__|fp-$name|g" fp-$name.yaml

cd fp-$name
image_without_tag=$(echo $image | cut -d: -f1)
image_tag=$(echo $image | cut -d: -f2)

for i in $(ls -1); do
    sed -i "s|__APP_NAME__|fp-$name|g" $i
    sed -i "s|__IMAGE_WITHOUT_TAG__|$image_without_tag|g" $i
    sed -i "s|__IMAGE_TAG__|$image_tag|g" $i
done