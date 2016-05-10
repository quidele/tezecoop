openssl genrsa -out privada 1024
pause
openssl req -new -key privada -out pedido -config afip-openssl.cnf
pause
