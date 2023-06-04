#/bin/bash

github_repo="git@github.com:$1.git"
read github_name <<< "${1##*/}"
dockerhub_repo=$2
read dockerhub_name <<< "${2##*/}"

git clone $github_repo

cd ./$github_name; docker build -t $github_name .

docker image tag $github_name $dockerhub_repo
docker push $dockerhub_repo
