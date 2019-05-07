#!/bin/bash

############FTP################
FtpServer=
FtpUser=
FtpPasswd=
Directory=

PUT(){
ftp -vipn $FtpServer <<End | grep -q '226 Transfer complete'
user $FtpUser $FtpPasswd
binary
cd $Directory
put $1 $2
quit
End
}

GET(){
ftp -vipn $FtpServer <<End | grep -q '226 Transfer complete'
user $FtpUser $FtpPasswd
binary
cd $Directory
get $1 $2
quit
End
}

DELETE(){
ftp -vipn $FtpServer <<End | grep -q '250 Delete operation successful'
user $FtpUser $FtpPasswd
binary
cd $Directory
delete $1
quit
End
}
