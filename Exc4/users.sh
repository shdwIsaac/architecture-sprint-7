#!/bin/bash
set -e

# Создаем директории для хранения ключей и сертификатов
mkdir -p certs

# Создание пользователя `user1` (просмотрщик)
openssl genrsa -out certs/user1.key 2048
openssl req -new -key certs/user1.key -out certs/user1.csr -subj "/CN=user1/O=cluster-viewer"
openssl x509 -req -in certs/user1.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out certs/user1.crt -days 365

# Создание пользователя `user2` (администратор)
openssl genrsa -out certs/user2.key 2048
openssl req -new -key certs/user2.key -out certs/user2.csr -subj "/CN=user2/O=cluster-admin"
openssl x509 -req -in certs/user2.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out certs/user2.crt -days 365

echo "Пользователи user1 и user2 успешно созданы с сертификатами."
