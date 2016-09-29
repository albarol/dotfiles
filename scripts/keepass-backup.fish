#!/usr/bin/fish

set KEEPASSX_DIR .config/keepassx
set TMP_FILENAME /tmp/(random).kdb


printf "\e[1;33mKeePassX Sync\n\
=============\e[0m\n\nUploading file...\n"

scp $HOME/$KEEPASSX_DIR/data.kdb fakeezz@fakeezz.com.br:/home/fakeezz/$KEEPASSX_DIR/backup/data.kdb
scp fakeezz@fakeezz.com.br:/home/fakeezz/$KEEPASSX_DIR/backup/data.kdb $TMP_FILENAME

if [ (md5sum $HOME/$KEEPASSX_DIR/data.kdb | awk '{print $1}') = (md5sum $TMP_FILENAME |awk '{print $1}') ]
    printf "\n\e[1;32mBackup successful\e[0m"
else
    printf "\n\e[1;31mBackup error\e[0m"
end
