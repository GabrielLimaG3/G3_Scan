#!/bin/bash

GREEN='\033[32;1m'
NC='\033[m'

echo -e "${GREEN}"
figlet "Vuln-Finder"
echo "        	                  by G3"
echo -e "${NC}"

if [[ "$1" == "-l" ]]; then

	mkdir "$2"

    	echo -e "${GREEN}"
    	echo -e "[+] Subfinder"
    	echo -e "${NC}"

    	subfinder  -d "$2" -all -silent -o "$2/subdomains.txt"

        echo -e "${GREEN}"
        echo -e "[+] HTTPX"
        echo -e "${NC}"

	cat "$2/subdomains.txt" | httpx -silent -o "$2/subdomains_ativos.txt"

	echo -e "${GREEN}"
        echo -e "[+] GAU"
        echo -e "${NC}"

    	cat "$2/subdomains_ativos.txt" | gau --threads 8 > "$2/EndpointsGau.txt"

    	echo -e "${GREEN}"
    	echo -e "[+] XSS"
    	echo -e "${NC}"

    	cat "$2/EndpointsGau.txt" | uro | gf xss > "$2/xss.txt"

    	echo -e "${GREEN}"
    	echo -e "[+] OpenRedirect"
    	echo -e "${NC}"

    	cat "$2/EndpointsGau.txt" | uro | gf redirect >  "$2/redirect.txt"

    	echo -e "${GREEN}"
    	echo -e "[+] LFI"
    	echo -e "${NC}"

    	cat "$2/EndpointsGau.txt" | uro | gf lfi > "$2/lfi.txt"

    	echo -e "${GREEN}"
    	echo -e "[+] SSRF"
    	echo -e "${NC}"
	cat "$2/EndpointsGau.txt" | uro | gf ssrf > "$2/ssrf.txt"

	echo -e "${GREEN}"
        echo -e "[+] JavaScript"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | uro | grep "\.js"> "$2/javascript.txt"

	echo -e "${GREEN}"
        echo -e "[+] XML"
        echo -e "${NC}" 

        cat "$2/EndpointsGau.txt" | uro | grep "\.xml"> "$2/xml.txt"

elif [[ "$1" == "-dl" ]]; then

	mkdir "Urls"

        echo -e "${GREEN}"
        echo -e "[+] Subfinder"
        echo -e "${NC}"

        subfinder -dL "$2" -all -silent -o "Urls/subdomains.txt"
        cat "Urls/subdomains.txt" | httpx -o "Urls/subdomains_ativos.txt"

        echo -e "${GREEN}"
        echo -e "[+] GAU"
        echo -e "${NC}"

        cat "Urls/subdomains_ativos.txt" | gau --threads 8 > "Urls/EndpointsGau.txt"

        echo -e "${GREEN}"
        echo -e "[+] XSS"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | gf xss > "Urls/xss.txt"

        echo -e "${GREEN}"
        echo -e "[+] OpenRedirect"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | gf redirect > "Urls/redirect.txt"

        echo -e "${GREEN}"
        echo -e "[+] LFI"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | gf lfi > "Urls/lfi.txt"

        echo -e "${GREEN}"
        echo -e "[+] SSRF"
        echo -e "${NC}"
        cat "Urls/EndpointsGau.txt" | uro | gf ssrf > "Urls/ssrf.txt"

	echo -e "${GREEN}"
        echo -e "[+] JavaScript"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | grep "\.js"> "Urls/javascript.txt"

	echo -e "${GREEN}"
        echo -e "[+] XML"
        echo -e "${NC}" 

        cat "$2/EndpointsGau.txt" | uro | grep "\.xml"> "$2/xml.txt"

elif [[ "$1" == "-u" ]]; then

	mkdir "$2"

        echo -e "${GREEN}"
        echo -e "[+] GAU"
        echo -e "${NC}"

	echo "$2" | gau --threads 8 > "$2/EndpointsGau.txt"
	echo -e "${GREEN}"
        echo -e "[+] XSS"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | uro | gf xss > "$2/xss.txt"

        echo -e "${GREEN}"
        echo -e "[+] OpenRedirect"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | uro | gf redirect > "$2/redirect.txt"

        echo -e "${GREEN}"
        echo -e "[+] LFI"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | uro | gf lfi > "$2/lfi.txt"

        echo -e "${GREEN}"
        echo -e "[+] SSRF"
        echo -e "${NC}"
        cat "$2/EndpointsGau.txt" | uro | gf ssrf > "$2/ssrf.txt"

	echo -e "${GREEN}"
        echo -e "[+] JavaScript"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | grep "\.js"> "$2/javascript.txt"

	echo -e "${GREEN}"
        echo -e "[+] XML"
        echo -e "${NC}" 

        cat "$2/EndpointsGau.txt" | grep "\.xml"> "$2/xml.txt"

elif [[ "$1" == "-ul" ]]; then

	mkdir "Urls"

	echo -e "${GREEN}"
        echo -e "[+] HTTPX"
        echo -e "${NC}"

	cat "$2" | httpx -silent -o "Urls/Urls_ativas.txt"

        echo -e "${GREEN}"
        echo -e "[+] GAU"
        echo -e "${NC}"

        cat "Urls/Urls_ativas.txt" | gau --threads 8 > "Urls/EndpointsGau.txt"
        echo -e "${GREEN}"
        echo -e "[+] XSS"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | gf xss > "Urls/xss.txt"

        echo -e "${GREEN}"
        echo -e "[+] OpenRedirect"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | gf redirect > "Urls/redirect.txt"

        echo -e "${GREEN}"
        echo -e "[+] LFI"
        echo -e "${NC}"

        cat "Urls/EndpointsGau.txt" | uro | gf lfi > "Urls/lfi.txt"

        echo -e "${GREEN}"
        echo -e "[+] SSRF"
        echo -e "${NC}"
        cat "Urls/EndpointsGau.txt" | uro | gf ssrf > "Urls/ssrf.txt"

	echo -e "${GREEN}"
        echo -e "[+] JavaScript"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | uro | grep "\.js"> "$2/javascript.txt"

	echo -e "${GREEN}"
        echo -e "[+] XML"
        echo -e "${NC}"

        cat "$2/EndpointsGau.txt" | uro | grep "\.xml"> "$2/xml.txt"

else
        echo "-l	Scan de Subdominios"
        echo "-dl	Scan de Lista de Subdominios"
	echo "-u	Scan de Url"
	echo "-ul	Scan de Lista de Urls"

fi
