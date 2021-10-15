sed -Ei "s/($(grep `tee | head -n1`, data.csv | cut -d "," -f1),)[0-9]*/\10/" data.csv
