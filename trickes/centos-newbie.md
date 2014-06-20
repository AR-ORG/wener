[toc]

���ҵ� CentOS / Play CentOS
===================

> ��¼���� centos �ľ���
> �ܶ�ʱ����Ҫ sudo �� root Ȩ�޵�ʱ����Ҫ�����ж�.������ֱ����root�ʻ�.

> ���Լ�ʹ��ʱ����Ҫ��װ����
> 
> ��ʼ���� -> ���ú� openssh-server -> ��Ӷ���� repo -> ��װ git
> ����[�ҵ�dotfiles](https://github.com/wenerme/dotfiles)
> ���������������


��ʼ minimal ����
---------------
```
# �����Ǵ����翩
ifconfig eth0 up
dhclient
# ��Ӹ��ʺ�, ���ú�����
useradd wener
passwd wener
# �� �������ʺ���ӵ� sudoers file ��
echo "wener ALL=(ALL) ALL" >> /etc/sudoers
# ����һ����
yum update -y
# ��Ϊ�� minimal �汾, �Ȱ�װһЩ��Ҫ�Ķ���
yum install man wget curl -y
# �ǳ�,����Ĳ�������root�²�����,��ȫ��
logout
# ��֮ǰ�������ʺŵ�¼
```

�� minimal ��׼��
-------

```
# Download ISOs
# UNETBootin
# Install
# ===============
# Configuration
# ===============
# basic upgrade
su root
yum upgrade
```

��������� repo
---------------
```
# add rpmforge
# fllow this http://wiki.centos.org/AdditionalResources/Repositories/RPMForge
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
# �汾�ſ���������ͬ,�μ����������
# ���ݸ��˵�ϵͳ����`uname -i`ѡ�� i686 �� x86_64
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -K rpmforge-release-*.rpm
rpm -i rpmforge-release-*.rpm
yum upgrade
```

����
-----
```
# lscpi
yum install pciutils -y
# iwconfig �����߹���
yum install wireless-tools -y

# �г��Ѱ�װ�İ�
yum list installed

# �л� TTY �Ŀ�ݼ� <C-A-F1-6>

# sudo ���ӵ��ļ�
echo BOOTPROTO=dhcp | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-wlan0

# ���� vbox �Ĺ���Ŀ¼
mkdir ~/shared
sudo mount -t vboxsf shared ~/shared

# ʹ��sudo�Ҳ��������ʱ��
# ���Կ��ǽ� /usr/local/bin/:/usr/local/sbin/ 
# ��ӵ� /etc/sudoers �� secure_path ��

# �ж�Զ��ĳ�˿��Ƿ���
timeout 1 bash -c 'cat < /dev/null > /dev/tcp/192.168.56.101/8087'
echo $?
```

CentOS �� ��װ��wpa_supplicant û��wpa_gui,���Բμ� [����](http://www.linuxfromscratch.org/blfs/view/svn/basicnet/wpa_supplicant.html),��Ҫ����Ϊ centos��wpa_supplicant �汾̫����,0.7��,�������µ���2.1��,�鿴[�ٷ���ҳ](http://w1.fi/wpa_supplicant/)������.�������������������centos��˵ �汾̫����,��װ�����ǳ�����.

�����������ڵ�vbox
------------------
�ܶ�ʱ��ֻ��Ҫ��ϵͳ����, Ȼ��Զ�� ssh ����, ͬʱҲ��Լ���ڴ�.
```
# ����һ. ʹ��������
# ֪������ϵͳ�����ֻ�UUID
VBoxManager list vms
# ����ָ����ϵͳ
VBoxManager -s UUID
# ��
VBoxManager -s ϵͳ����
# ������. �ڵ�������ť��ʱ��,��ס Shift ����
```

��װǰ��
--------

```
# �ڽ������а�װ��ʱ�� �����Ѿ����ú��� rpmforg �Ѿ���װ�˿���tao#�׼� groupinstall "Development tools" -y
```

Install 7z
-----------
```
# Install 7zip, centos can not uncompress some zip file.
yum install p7zip -y
```

��װ GUI, ֻ����� minimal ��װ��
----------------------------------
```
yum -y groupinstall "X Window System" "Desktop" "Fonts" "General Purpose Desktop"
# Ĭ����û�л����,�Լ��ֶ���װ
yum -y firefox
```

��װvirtual-box�ĸ�����չ
--------------------------
һ��ֱ�Ӱ�װ��չ��ʱ��װ��ģ���п���ʧ��.
```
# �ο� http://wiki.centos.org/HowTos/Virtualization/VirtualBox/CentOSguest
# ��Ҫ�����ú� rpmforge
yum -y install dkms
yum -y groupinstall "Development Tools"
yum -y install kernel-devel
```

��װ git
--------
```
# ��Ϊ git �汾̫����,���Դ����Լ���װgit
yum --enablerepo=updates clean metadata
yum install perl-devel -y
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel -y
# ���Կ���ʹ�������汾, ���� https://github.com/git/git/archive/v1.9.4.zip
# ʹ�÷������ȶ�Щ
curl -L -o git.zip https://github.com/git/git/archive/master.zip
# ��
# wget -O git.zip https://github.com/git/git/archive/master.zip
unzip git*.zip
cd git*
make prefix=/usr/local all
make prefix=/usr/local install
# ������ܺ� �� Development tools ���git��ͻ
# �����Ƴ���װ��git ���´��ն˾ͺ���
yum remove git
exit
# reopen an terminal
# ��������Ƴ� git
# ����� git ��hash�ͺ���
hash -d git
```


Intsall ntfs-3g
----------------
```
# Add ntfs filesystem support, because I install centos with win7
# fllow this http://wiki.centos.org/TipsAndTricks/NTFS
yum install ntfs-3g -y
```

Install iBus
--------------
```
# fllow this http://code.google.com/p/ibus/wiki/CentOS
# 1.Install necessary packages
yum install ibus ibus-gtk ibus-qt
yum install ibus-pinyin # or other engine(s) you want
yum install im-chooser 
# 2. Enable input method at System->Perferences->Input Method
# 3. Add input methods
# 4.Re-login
```

Install python2.7 for goagent
-----------------------------
```
# Setup Development tools 
yum groupinstall "Development tools" -y
# basic lib
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel -y

# Manualy install puthon2.7, not change the system's 2.6 version
# When I install python 2.7.x, the newest is 2.7.5
# go check at http://python.org/ftp/python/
# BTW, you can install 3.x python by this way
PYTHON_VERSION=2.7.5
mkdir ~/src && cd $_
wget http://python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.bz2
tar xf Python-${PYTHON_VERSION}.tar.bz2
cd Python-${PYTHON_VERSION}
./configure --prefix=/usr/local

# -j 8 for more quickly
# Notice, make install change to make altinstall
make -j 8 && make altinstall
```

Install python-openssl for python2.7
------------------------------------
```
# Install python-openssl for goagent
mkdir -p ~/src && cd $_
yum install openssl openssl-devel -y
wget --no-check-certificate https://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.13.tar.gz
tar -xzfv pyOpenSSL-0.13.tar.gz
cd pyOpenSSL-0.13
# Notice, compile for python2.7
python2.7 setup.py build_ext -I /usr/local/include/python2.7/ -L /usr/local/lib/python2.7/
python2.7 setup.py build
python2.7 setup.py install
```

Install goagent
-----------------
```
# Download goagent and run it, because I have to install chrome
mkdir -p ~/app && cd $_
wget https://goagent.googlecode.com/archive/3.0.zip
7za x 3.0.zip
mv goagent-* goagent

# setup your gea
vim goagent/local/proxy.ini

# and run
python2.7  goagent/local/goagent-gtk.py &
```

Install chrome
--------------
```
# Setup wget proxy for download chrome
# append the proxy setting to '/etc/wgetrc'
# Reamove it, when you do not need this
https_proxy = http://127.0.0.1:8087/
http_proxy = http://127.0.0.1:8087/
ftp_proxy = http://127.0.0.1:8087/
use_proxy = on

# Install google-chrome
# fllow this http://chrome.richardlloyd.org.uk/
mkdir -p ~/app && cd $_
wget http://chrome.richardlloyd.org.uk/install_chrome.sh
chmod u+x install_chrome.sh
./install_chrome.sh
```

Install gvim7.4
---------------
```
mkdir -p ~/src && cd $_
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar -jxvf vim-7.4.tar.bz2
# 
yum install lua lua-devel -y
yum install libX11 libX11-devel libXt-devel libgtk2 libgtk2-devel -y
#
VIM_FLAG='--enable-luainterp=yes --enable-cscope --enable-multibyte --enable-fontset --enable-gui'
#
./configure $VIM_FLAG
make -j 8 && make test -j 8 && make install
```

Install vim
---------------
```
# ֱ��ʹ��yum�������� Ϊ��ʹ�ü�
yum install vim-enhanced -y

```

Install Nvidia-driver
----------------------
```
# find out you card info
lspic | grep VGA
# download form nvidia http://www.nvidia.in/Download/index.aspx

# prepare
yum update
yum clean all
yum groupinstall "Development Tools"
yum install kernel-devel kernel-headers gcc make

added the following line to /etc/modprobe.d/blacklist.conf file
```





Bully + Aircrack-ng + Reaver
-------------------

> [reaver](https://reaver-wps.googlecode.com/files/reaver-1.4.tar.gz)  
> [aircrack-ng-1.2-beta1](http://download.aircrack-ng.org/aircrack-ng-1.2-beta1.tar.gz) 
> reaver ����� [bully](https://github.com/bdpurcell/bully)

```
# ׼������
yum install -y libpcap libpcap-devel openssl-devel sqlite sqlite-devel
# ���libnl ������֧�� netlink (nl80211) ��
yum install -y libnl libnl-devel

# �ȸ�� bully
curl -L -o bully.zip https://github.com/bdpurcell/bully/archive/master.zip
7za x bully.zip
cd bully-master/src
make
make install
cd -

# �ٸ� Aircrack-ng
# �Ұ�װʱ ��߰汾Ϊ 1.2-beta3
# ������Ҫע�����, aircrack-ng ��ǽ��,���������ص�ʱ���ǵ�
# ���Ƿ��ڹ���Ŀ¼����������
# Ҳ���Դ� github ����
# https://github.com/aircrack-ng/aircrack-ng
wget -O aircrack-ng.tar.gz http://download.aircrack-ng.org/aircrack-ng-1.2-beta3.tar.gz
tar -xvf aircrack-ng.tar.gz
cd aircrack-ng-*
# ��װ���̿��Բο�����
# http://www.aircrack-ng.org/doku.php?id=install_aircrack#installing_aircrack-ng_from_source
make sqlite=true
sudo make install
# ���� OUI
sudo airodump-ng-oui-update

# ��װ reaver, ��Ȼ��bully,����reaver�����������
wget https://reaver-wps.googlecode.com/files/reaver-1.4.tar.gz
tar -xzvf reaver-*.tar.gz
cd reaver-*/src
./configure
make
make install
```

pin creack
----------

```bash
ifconfig wlan0 down
# �������ʾһЩ�п��ܱ�Ӱ��Ľ��� dhclient �� wpa_supplicant
# ���Կ��ǽ���Щ���̹ر�
airmon-ng start wlan0
bully -e �ȵ����� -v3 mon0

# ʹ�� reaver �ķ���
wash -i mon0
reaver -a -S -vv -i mon0 -b `MAC`
```

ͨ������������������, �򵥰�
----------------------------
���� [connect-to-a-wireless-network-via-command-line](http://www.ghacks.net/2009/04/14/connect-to-a-wireless-network-via-command-line/)

```
#! /bin/bash
ifconfig wlan0
iwconfig wlan0 essid NETWORK_ID key WIRELESS_KEY
dhclient wlan0
```
`NETWORK_ID` Ϊ������  
`WIRELESS_KEY` �㲻���,Ӧ���������. Ĭ��Ϊ 16 ���Ƶ�ֵ,������ `s:WIRELESS_KEY` ��ʹ��ascii

ͨ������������������
--------------------

���� [how-to-connect-to-wpawpa2-wifi-network](http://linuxcommando.blogspot.com/2013/10/how-to-connect-to-wpawpa2-wifi-network.html)

��Ҫʹ�õĹ���
`yum install wpa_supplicant wireless-tools -y`

```
# 1. �鿴��������豸��
$iw dev
phy#0
	Interface wlan0
		ifindex 3
		type managed
# 2. ��������豸�Ƿ����� ������Ҫ�и�UP
$ ip link show wlan0
3: wlan0: (BROADCAST,MULTICAST) mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
    link/ether 74:e5:43:a1:ce:65 brd ff:ff:ff:ff:ff:ff
# ���������豸
$ ip link set wlan0 up

# ��������豸�Ƿ����� �����и�UP
$ ip link show wlan0
3: wlan0: (NO-CARRIER,BROADCAST,MULTICAST,UP) mtu 1500 qdisc mq state DOWN mode DEFAULT qlen 1000
    link/ether 74:e5:43:a1:ce:65 brd ff:ff:ff:ff:ff:ff

# 3. �������״̬
$ /sbin/iw wlan0 link
Not connected.

# 4. ɨ������
$ sudo /sbin/iw wlan0 scan
BSS 00:14:d1:9c:1f:c8 (on wlan0)
        ... �Թ� ...
	freq: 2412
	SSID: Touch-me
	RSN:	 * Version: 1
		 * Group cipher: CCMP
		 * Pairwise ciphers: CCMP
		 * Authentication suites: PSK
		 * Capabilities: (0x0000)
        ... �Թ� ...

# ����� SSID �� ��ȫЭ�����ͺ���Ҫ
# ������ RSN, �� wpa2

# 5. ���ӵ� WPA/WPA2 wifi

$ wpa_passphrase �������� >> /etc/wpa_supplicant.conf 
��������

# ��ȷ��Ӧ����������
$ cat /etc/wpa_supplicant.conf 
# reading passphrase from stdin
network={
	ssid="gorilla"
	#psk="testtest"
	psk=4dfe1c985520d26a13e932bf0acb1d4580461dd854ed79ad1a88ec221a802061
}

# ����
$ sudo wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf
# -B �ں�̨����
# -D ָ��������Ϊ, wextΪ��ͨ�����豸
# -c �����ļ�·��

# ����Ƿ�����
$ /sbin/iw wlan0 link
Connected to 00:14:d1:9c:1f:c8 (on wlan0)
	SSID: gorilla
	freq: 2412
	RX: 63825 bytes (471 packets)
	TX: 1344 bytes (12 packets)
	signal: -27 dBm
	tx bitrate: 6.5 MBit/s MCS 0

	bss flags:	short-slot-time
	dtim period:	0
	beacon int:	100
# 6. ͨ�� DHCP ��ȡ IP��ַ
$ sudo dhclient wlan0
# ��ʱ���޷���ȡ ���Կ��� dhclient -x �رպ���»�ȡ

# �鿴 IP ��ַ
$ ip addr show wlan0
3: wlan0:  mtu 1500 qdisc mq state UP qlen 1000
    link/ether 74:e5:43:a1:ce:65 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.113/24 brd 192.168.1.255 scope global wlan0
    inet6 fe80::76e5:43ff:fea1:ce65/64 scope link 
       valid_lft forever preferred_lft forever
	   
# 7. ���Ĭ��·�ɹ���(���Թ�)
$ ip route show
192.168.1.0/24 dev wlan0  proto kernel  scope link  src 192.168.1.113 

#  ����������ת�� (192.168.1.*) �� wlan0,���������������� ���������·���
$ sudo ip route add default via 192.168.1.254 dev wlan0
$ ip route show
default via 192.168.1.254 dev wlan0 
192.168.1.0/24 dev wlan0  proto kernel  scope link  src 192.168.1.113 

# 8. �����Ƿ���ȷ����
$ ping 8.8.8.8
```

�Զ��������ߵ�����
-------------

�ο��ٷ��� [wpa_supplicant ����](http://wiki.centos.org/HowTos/Laptops/WpaSupplicant)
����û���ᵽ�� wlan0 �����Զ��� dhcp

�о��� 
`echo BOOTPROTO=dhcp | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-wlan0`
�����Ϳ�����~���ǻ��ǲ���,����Ҫ `dhclient wlan0`

��Ҫ�ο� [���](http://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-networkscripts-interfaces.html) ������.Ҳ���Բο�[���](http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch13_:_Linux_Wireless_Networking#.U0YCk_mSyR0)������.

```
# ����
wp _supplicantwpaa_supplicant -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant.conf -d
```

��������
--------

�� `grub` ������ʱ��, �ж��Զ�����, ����ѡ���б��ʱ��, �� `a`, ɾ�� `rhgb quiet` Ȼ������ `1` �س�, ���ɽ��뵥�û�ģʽ. ���ʹ�� passwd �޸��������������Ϳ��Իص����û�ģʽ��.

�ο� [ResetRootPassword](http://wiki.centos.org/TipsAndTricks/ResetRootPassword)

��װ��������
=============

Install JDK
----
������Ҫ��װ�� jdk ������, ѡ�� openJDK ���� oracle �� jdk
�ɲο�����[webupd8](https://launchpad.net/~webupd8team/+archive/java) ����װ oracle ��jdk.
���߲ο�[���](http://d.stavrovski.net/blog/post/how-to-install-and-setup-oracle-java-jdk-in-centos-6)��װ����,�����Բο�[����](https://wiki.powerfolder.com/display/PFS/Installing+Oracle+Java+on+Linux)
```
# �鿴 repo ��֧�ֵ� jdk �汾, һ�� centos ��repo��ֻ�� openjdk
yum search java-1
# ȷ��ϵͳ��û�� �Ѿ���װ
rpm -qa | grep java-
# ����еĻ� ��ɾ��syum remove java-1.6.0-openjdkayn`
```
��ѡ�����[����](http://www.oracle.com/technetwork/java/javase/downloads/index.html)�� oracle �� jdk,�Ͼ� oracle ��jdk���ȶ�Щ.

�Ұ�װ JDK8 �����ص�ַ
http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.rpm

```
wget --no-check-certificate --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie"\
    "http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.rpm"
rpm -Uvh jdk-*.rpm
```


Install nodejs
---------------
```
mkdir -p ~/src && cd $_
wget -e "http_proxy = http://127.0.0.1:8087/"  http://nodejs.org/dist/node-latest.tar.gz
tar zxvf node-latest.tar.gz
./configure
make && make install
# Already installed npm with nodejs source
```

Install nginx
-------------
```
# add nginx repo
cat > /etc/yum.repos.d/nginx.repo <<WEN
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
WEN
# check
yum repolist
# install
yum install nginx -y
```

Install php
------------
```
yum groupinstall 'PHP Support'
```
��װ����
=============

Install vsftpd
---------------

```
# ȷ����
yum search vsftpd
```

Install openssh-server
-------------------
```
# �ο� http://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-openssh-server-config.html
yum install openssh-server -y
# �����ļ�Ϊ /etc/ssh/sshd_config
# ����
/sbin/service sshd start
# ����������
# ssh �û���@��linux������IP
```

Install tomcat
----------
```
tar -zxvf apache-tomcat*.tar.gz
mv apache-tomcat* /opt/tomcat
# ����
/opt/tomcat/bin/startup.sh
# ���� iptable, ʹ�ⲿ���Է���
# �鿴Ŀǰ�� IPTables ����
iptables -nL --linenumber
# ȷ�������� REJECT any ǰ��, 5 Ϊ�к� ���ݸ��˵�����޸�
iptables -I INPUT 5 -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT -m comment --comment "Tomcat Server port"
service iptables save
```

Install hadoop
--------------
�ο�[����](http://tecadmin.net/steps-to-install-hadoop-on-centosrhel-6/)

Install apache
--------------
[apache-inshttpd](https://www.centos.org/docs/5/html/Cluster_Administration/s1-apache-inshttpd-CA.html)
```
yum install httpd
# ��ɺ� ��Ҫ�� /etc/httpd/conf/httpd.conf �����һ��
# ServerName localhost
# �����Ҫʹ�� apachectl status ���� ��Ҫ elinks �� mod_status
# ����ʹ�� status ���ִ������� �ο�
# http://www.mydigitallife.info/request-url-server-status-or-404-page-not-found-apache-error/
```
��Ҫʹ�� apachectl status �� httpd.conf �������������
```
ExtendedStatus on
<IfModule mod_status.c>
    # Allow server status reports generated by mod_status,
    # with the URL of http://servername/server-status
    # Change the ".example.com" to match your domain to enable.
    #
    <Location /server-status>
        SetHandler server-status
        Order deny,allow
        Allow from all
    </Location>
</IfModule>
```

### ���� mod_jk
```
# ʹ�õ�ʱ�� ֻ�� 1.2.40 �汾
# ���Բ鿴�����汾 http://www.apache.org/dist/tomcat/tomcat-connectors/jk/
wget http://www.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.40-src.zip
unzip tomcat-connectors*.zip
cd tomcat-connectors*
cd native
# �����е㳶������ ��Щ�ű�����dos ��ʽ�� ������Ҫ�� dos2unix
# ������ֱ�ӻ��˸��汾 ʹ�õ� 1.2.39 ��, �����û����
yum install -y httpd-devel
./configure --with-apxs=/usr/sbin/apxs
make
make install
```

��Ⱥ������ɸ�����ͨ��ˢ�� http://cloud01/manager/status ���ҳ��, �۲� IP address ���ж��Ƿ�ɹ�.

Install MySQL
---------------
```
yum -y groupinstall 'MySQL Database server' 'MySQL Database client'
yum -y install php-mysql
#/sbin/service mysqld start
#/sbin/service mysqld stop
#/sbin/service mysqld restart
```
