# Descan
Escaner de puertos locales tcp, este envía paquetes a los distintos puertos mediante descriptores de archivos y recoge el error para determinar si está abierto o no

## uso:
Esta es una herramienta sencilla y fácil de usar, está desarrollada en bash.
La sintaxis es la siguiente:
``` bash
./descan.sh {opciones}
```
## opciones
| bandera | descripción |
| ---------| ------------|
| -p | Escanea los 65535 puertos |
| -n [max-port] | Escanea desde puerto 1 hasta [max-port]|
| -h | Panel de ayuda |