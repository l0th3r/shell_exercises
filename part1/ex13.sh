echo -e `head -n2 | tr "\n" ' ' | sed -z "s/ /,1,/"` >> data.csv
