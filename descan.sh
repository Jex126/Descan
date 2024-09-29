#!/bin/bash
ap=0
np=0
n=65535
function ayuda(){
echo -e "Panel de ayuda:\n-p : Escanea los 65535 puertos\n-n [max-port]: escanea desde puerto 1 hasta [max-port]\n-h : Panel de ayuda"
exit 0
}
function allports(){
    local tmp_dir=$(mktemp)
    for puerto in $(seq $1 $2); do
    (echo "ss" >& /dev/tcp/127.0.0.1/$puerto) 2> $tmp_dir 
    estado=$(<"$tmp_dir")
    if [ -z "$estado" ]; then
        echo "Puerto $puerto: abierto"
    fi
done
rm $tmp_dir
}

while getopts ":phn:" opt; do

    case ${opt} in
        p) ap=1;;
        n) np=1; n=${OPTARG} ;;
        h) ayuda ;;
        *) ayuda ;;
    esac
done
contBanderas=$(($ap + $np))
if [ "$contBanderas" -eq 2 ]; then
    ayuda
else
    if [ "$ap" -eq 1 ]; then
        allports 1 13107 &
        allports 13108 26214 &
        allports 26215 39321 &
        allports 39322 52428 &
        allports 52429 65535 &
        wait
    elif [ "$np" -eq 1 ]; then
        allports 1 $n
    fi
fi