#!/usr/bin/fish

set alertafs /tmp/alerta-(random).list
set titansfs /tmp/titans-(random).list
set final /tmp/final.list

vf activate tws

echo "key;type;user;pwd;host;tunnel" > $final

# config alerta
echo "Getting alerta info"
cp -f $HOME/.aws/alerta $HOME/.boto
tws instance list --region us-east-1 >> $alertafs
tail -n+4 $alertafs| awk -F'|' '{print "alerta-"$7"-"$4"-"$5"-"$2";ssh;alexandre.barbieri;;"$3";"}' | sed 's/ //g' | head -n-1 >> $final

# config titans
echo "Getting titans info"
cp -f $HOME/.aws/titans $HOME/.boto
tws instance list --region sa-east-1 >> $titansfs
tail -n+4 $titansfs | awk -F'|' '{print "titans-"$7"-"$4"-"$5"-"$2";ssh;alexandre.barbieri;;"$3";"}' | sed 's/ //g' | head -n-1 >> $final

# add previous mysql
echo "Getting mysql info"
cat $FSSH_DB | grep mysql >> $final

cat $final > $FSSH_DB
