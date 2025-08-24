#!/bin/bash
set -e

mkdir -p build/ca-certs
cd build/ca-certs

curl -o cacert.pem https://curl.se/ca/cacert.pem

mkdir -p etc
mkdir -p etc/ssl
mkdir -p etc/ssl/certs

mv cacert.pem etc/ssl/cert.pem
ln -sf ../cert.pem etc/ssl/certs/ca-certificates.crt
ln -sf ../cert.pem etc/ssl/certs/ca-bundle.crt

cd ../..

tar -czf done/ca-certs.tar.gz -C build/ca-certs .
