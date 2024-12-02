#!/bin/bash
# Привязка ролей к пользователям

# Привязка роли cluster-viewer к user1
kubectl create clusterrolebinding user1-viewer-binding \
  --clusterrole=cluster-viewer \
  --user=user1
  
kubectl create clusterrolebinding user1-secrets-reader-binding \
  --clusterrole=secrets-reader \
  --user=user1

# Привязка роли cluster-admin к user2
kubectl create clusterrolebinding user2-admin-binding \
  --clusterrole=cluster-admin \
  --user=user2

echo "Роли успешно привязаны к пользователям."
