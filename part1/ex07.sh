wc -m `file * -i | grep "/csv;" | cut -d ":" -f1 | sed -z "s/\n/ /g"` | sort -n | tail -n2 | head -n+1 | awk 'NF>1{print $NF}'
