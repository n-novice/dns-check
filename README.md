# DNS check test (dig)
output : results_YYYYMMDDHHMMSS.txt

- dns_list.txt  
  -> List of DNS servers 
~~~
8.8.8.8  
1.1.1.1  
208.67.222.222  
~~~

- domain_list.txt  
  ->Entry example  
~~~
query,URL
(Example)a,www.google.com
~~~

- Execution result
~~~
//=========================================================================================
//Domain: www.google.com(Quuery: a)  [dig +noall +answer  -t a <DNS> www.google.com]
//-----------------------------------------------------------------------------------------
---
>>> DNS : 8.8.8.8
www.google.com.         200     IN      A       172.217.161.36

---
>>> DNS : 1.1.1.1
www.google.com.         118     IN      A       216.58.197.4

---
>>> DNS : 208.67.222.222
www.google.com.         128     IN      A       172.217.175.228
~~~
