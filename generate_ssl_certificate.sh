#!/bin/sh
# This script generates a self-signed certificate: CA, server.

set -e
set -x

# Change these if needed
BITS=2048
DAYS=90

if test -z "$1" ; then
  echo "Usage: ./$0 <domain_name>"
  exit 1
fi

MY_DOMAIN="$1"

CAS="/CN=$MY_DOMAIN/O=$MY_DOMAIN/C=IE/L=Dublin"
SUBJ=${SUBJ:="/CN=$MY_DOMAIN/O=$MY_DOMAIN/C=IE/L=Galway"}
SERIAL=$(date +%s)

echo $SERIAL > ca.srl
openssl genrsa -out ca.key $BITS
openssl req -new -x509 -key ca.key -out ca.crt -nodes -days $DAYS -subj "$CAS"
cat ca.key ca.crt > ca.pem

openssl genrsa -out server.key $BITS
openssl req -key server.key -new -out server.req -days $DAYS -subj "$SUBJ"
openssl x509 -sha256 -req -in server.req -CA ca.pem -CAkey ca.pem -out server.crt -days $DAYS
cat server.key server.crt > server.pem
