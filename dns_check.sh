#!/bin/bash
URL="./domain_list.txt"
DNS="./dns_list.txt"
Op=" -t "
FNAME=results_`date +%Y%m%d%H%M%S`.txt

cat "$URL" | while read line
do
  query=`echo ${line} | cut -d ',' -f 1`
  domain=`echo ${line} | cut -d ',' -f 2`
  query2=$Op$query
  echo "//=========================================================================================" >> $FNAME
  echo "//Domain: ${domain}(Quuery: ${query})  [dig +noall +answer ${query2} <DNS> ${domain}]" >> $FNAME
  echo "//-----------------------------------------------------------------------------------------" >> $FNAME

  cat "$DNS" | while read line2
  do
    com=$(dig +noall +answer $query2 @${line2} "$domain")
    ans=${com}
    echo "---  "  >> $FNAME
    echo -e ">>> DNS : $line2" >> $FNAME
    echo -e "$ans" >> $FNAME
    echo ""  >> $FNAME
    usleep 300000

  done < "$DNS"

done < "$URL"

cat $FNAME
