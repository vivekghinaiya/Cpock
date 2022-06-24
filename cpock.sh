domain=$1

wordlist()

{
echo "$domain" | tee 1.txt
echo "$domain" | waybackurls | tee 2.txt
cat 1.txt 2.txt | sort -u | tee urls.txt
cat urls.txt | worldistgen | cut -f1 -d "." | tee endpoints1.txt

python3 /home/tools/LinkFinder/linkfinder.py -i $domain -d -o cli | wordlistgen | cut -f1 -d "." | tee endpoints2.txt

cat endpoints1.txt endpoints2.txt | sort -u | tee wordlist.txt
}
wordlist

echo "your wordlist is ready :) "
