#!/bin/bash

echo "Criando as imangens....."

docker build -t marcospmelo/projeto-backend:1.0 backend/.
docker build -t marcospmelo/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push marcospmelo/projeto-backend:1.0
docker push marcospmelo/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes.."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml