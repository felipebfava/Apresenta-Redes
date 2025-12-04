#!/bin/sh

SSL_DIR="./ssl" # Cria a pasta nginx/ssl caso não exista

mkdir -p "$SSL_DIR"

# Executa openssl para gerar:
# certificado com validade de 365 dias
# sem senha (nodes = non DES encrypted)
# preenchido com: Pais - BR; Estado - SC; Cidade - Videira; Organização - AngelCorp; Unidade - IT; Common Name (CN) - www.angelcorp.com.br
# será criado o arquivo para chave privada - nginx-selfsigned.key e pública - nginx-selfsigned.crt

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$SSL_DIR/nginx-selfsigned.key" \
    -out "$SSL_DIR/nginx-selfsigned.crt" \
    -subj "/C=BR/ST=SC/L=Videira/O=AngelCorp/OU=IT/CN=www.angelcorp.com.br"