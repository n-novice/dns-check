#!/bin/bash
URL="./domain_list.txt"  #チェックリスト
DNS="./dns_list.txt"     #DNSサーバリスト
Op=" -t "                #dig option
FNAME=results_`date +%Y%m%d%H%M%S`.txt #出力するリザルトファイル名

#チェックリストの読み込み
cat "$URL" | while read line
do
  #カラム数が２であることを確認（クエリ.domain)
  col=`echo ${line}  | awk -F "," '{print NF}'`
  if [ $((col)) -eq 2 ]; then

    #query,domainに代入
    query=`echo ${line} | cut -d ',' -f 1`
    query2=$Op$query
    domain=`echo ${line} | cut -d ',' -f 2`
    echo "//=========================================================================================" >> $FNAME
    echo "//Domain: ${domain}(Quuery: ${query})  [dig +noall +answer ${query2} <DNS> ${domain}]" >> $FNAME
    echo "//-----------------------------------------------------------------------------------------" >> $FNAME

    #DNSサーバリストからサーバ情報を１行読み込む
    cat "$DNS" | while read line2
    do
      #コマンド実行
      com=$(dig +noall +answer $query2 @${line2} "$domain")
      ans=${com}
      echo "---  "  >> $FNAME
      echo -e ">>> DNS : $line2" >> $FNAME
      echo -e "$ans" >> $FNAME
      echo ""  >> $FNAME

      #スリープ時間
      usleep 300000
    done < "$DNS"
  else
    echo "---"  >> $FNAME
    echo "Syntax error : ${line}" >> $FNAME
    echo "---"  >> $FNAME
  fi
done < "$URL"

#出力リザルトの表示
cat $FNAME
