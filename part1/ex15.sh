cat data.csv | tail -n+2 | sort -n --field-separator=',' --key=2 | tail -n1 | rev | cut -d "," -f3 | rev
