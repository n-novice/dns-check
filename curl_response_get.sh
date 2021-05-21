#/bin/bash
sudo echo `date "+%Y-%m-%d %H:%M:%S"` ` curl -m 10 -w ' , content_type=%{content_type} , filename_effective=%{filename_effective} , ftp_entry_path=%{ftp_entry_path} , http_code=%{http_code} , http_connect=%{http_connect} , local_ip=%{local_ip} , local_port=%{local_port} , num_connects=%{num_connects} , num_redirects=%{num_redirects} , redirect_url=%{redirect_url} , remote_ip=%{remote_ip} , remote_port=%{remote_port} , size_download=%{size_download} , size_header=%{size_header} , size_request=%{size_request} , size_upload=%{size_upload} , speed_download=%{speed_download} , speed_upload=%{speed_upload} , ssl_verify_result=%{ssl_verify_result} , time_namelookup=%{time_namelookup} , time_connect=%{time_connect} , time_appconnect=%{time_appconnect} , time_pretransfer=%{time_pretransfer} , time_redirect=%{time_redirect} , time_starttransfer=%{time_starttransfer} , time_total=%{time_total} , url_effective=%{url_effective}' -o /dev/null -s 'https://www.google.com/'` >> /home/script/result.txt

numlines=$(sed -n '$=' /home/script/result.txt)

if [ $numlines -gt 20000 ] ; then
  sed -i '1,1200d' /home/script/result.txt
fi
