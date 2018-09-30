使用冰峰VPN，如附件
电信：60.191.133.234 
VPN帐号：erpgw 
密码：erpgw_1234
http://192.168.10.12/gas/wa/r/gdc-tiptop-udm-intranet  
system  dbsystem 
sys     sys 
AP:192.168.10.12 
ERP账号密码：tiptop  ttdcms123
DB:192.168.10.11 
CR:192.168.10.13 
administrator  123456 
VPN连上后，xshell登入ERP，此时不能起画面需要ipconfig查询本地分配的IP地址（一般是3.3.0.xxx的网段），然后执行export FGLSERVER=分配IP
若配完IP还是不起画面，可连CR远程