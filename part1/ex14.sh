cat data.csv | tail -n+2 | cut -d "," -f2 | sort -n | tail -n1
