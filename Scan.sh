#!/bin/bash

# Display banner
echo -e "\033[32;1m"
figlet "G3 Scan"
echo -e "\033[m"

mkdir $1

subfinder -d $1 -o $1/subdomains.txt

cat $1/subdomains.txt | gau --threads 5 | tee $1/EndpointsGau.txt

echo -e "\033[32;1m"
echo -e "[+] XSS"
echo -e "\033[m"

cat $1/EndpointsGau.txt | gf xss | tee $1/xss.txt

echo -e "\033[32;1m"
echo -e "[+] OpenRedirect"
echo -e "\033[m"


cat $1/EndpointsGau.txt | gf redirect | tee $1/redirect.txt

echo -e "\033[32;1m"
echo -e "[+] LFI"
echo -e "\033[m"


cat $1/EndpointsGau.txt | gf lfi | tee $1/lfi.txt

echo -e "\033[32;1m"
echo -e "[+] SSRF"
echo -e "\033[m"


cat $1/EndpointsGau.txt | gf ssrf | tee $1/ssrf.txt


