cat data.csv | cut -d "," -f3 | uniq -c | sort -nr | head -n1 | rev | cut -d " " -f1 | rev
