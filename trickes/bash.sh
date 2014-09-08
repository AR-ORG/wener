# �ο��ĵ�
# BASH �ο��ֲ� http://www.gnu.org/software/bash/manual/bashref.html
# Advanced Bash-Scripting Guide http://tldp.org/LDP/abs/html/


# ===========================================
# =================SHELL ����================
# ===========================================

# download: remote -> local
scp user@remote_host:remote_file local_file 

# local_file ����ΪĿ¼

# upload: local -> remote
scp local_file user@remote_host:remote_file

# �Եڶ�������, �����ֵķ����Ƚ�
sort -n -k 2

# ��ʾ�ڴ漰cpuʹ�����
top -abMmc -d 0.01 |head -20
# M ��λΪ m
# m ��ʾ����ʹ�õ� �����Ǿ����С VIRT
# c ��ʾ������������

# top ��ʾ�� USED ���ܻ�ܶ�,��Ϊ�кܶ� CACHED �����û��ʲô
# �ο����� http://www.linuxatemyram.com/
# ����뿴�鿴ʵ�ʿ��е��ڴ�, ����ʹ��
free -tm

# �������ε���ʾ
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'

# ʹ�� rsync + ssh ͬ��
rsync -avze ssh /localpath robot@192.168.1.171:/remote/path

# scp to ��̨
for dest in $(<destfile.txt); do
  scp ourfile.txt ${dest}:remote/path/
done

# �ڲ��� scp ������� ��������̨
cat file.txt | tee >(ssh user@ip1.com "cat > file.txt") \
                   >(ssh user@ip2.com "cat > file.txt")

tar cz file1 file2 file3 | tee >(ssh user@ip1.com "tar xz") \
                               >( ... )
							   
# ��������
chkconfig --level 23 network on
chkconfig --add foo
chkconfig --del foo
# ubuntu ����ʹ�� update-rc.d
sudo update-rc.d mysql defaults
sudo update-rc.d mysql remove
# ���������������������������
ntsysv

# ���ô���
export https_proxy=http://192.168.1.103:8087/
export http_proxy=$https_proxy
export ftp_proxy=$https_proxy

# �����ؼ���
echo -e "Wener\nis\ngreate" | grep -i -e "wen\|$" -e "greate\|$"

# wget �����ڻ�ȡ googlecode ��Ϊ��ʵ�������ز�����~
# ��Ҫ�������� �Ѿ��� .wgetrc �������˴���
# http://downloadsvn.codeplex.com/ Ҳ������������ svn ���ǲ����ô���
wget ... -e use_proxy=on

wget -m -np http://myproject.googlecode.com/svn/myproject/trunk/
wget --user=yourusername --ask-password -m -np http://myproject.googlecode.com/svn/myproject/trunk/

# ===========================================
# =================BASH ����=================
# ===========================================

# bash ��ʷ���� http://superuser.com/questions/7414/
# Ctrl+R ��ʼ���� ���� Ctrl+R �����������
# ���԰�Ϊ��������
bind '"\C-t": reverse-search-history'
# �����¼�Ϊ ������������İ���
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# �鿴��ʷ��¼
history
# ʹ��ĳ��
!2
# ���߸���������Ҳ����
!-2
# Ҳ����ֱ��ʹ��ƥ�������
!ech
# ���߲�һ��ƥ�俪ʼ
!?ho
# ���������滻����
^old^new
# ������ø�ѡ��, ���������˴��������
shopt -s histverify

# �жϱ���״̬
                        +-------+-------+-----------+
                VAR is: | unset | empty | non-empty |
+-----------------------+-------+-------+-----------+
| [ -z "${VAR}" ]       | true  | true  | false     |
| [ -z "${VAR+set}" ]   | true  | false | false     |
| [ -z "${VAR-unset}" ] | false | true  | false     |
| [ -n "${VAR}" ]       | false | false | true      |
| [ -n "${VAR+set}" ]   | false | true  | true      |
| [ -n "${VAR-unset}" ] | true  | false | true      |
+-----------------------+-------+-------+-----------+

# չ������  ��������ڻ���δ���� �����ʾ��Ϣ
${STATE?"Need to set STATE"}
${DEST:?"Need to set DEST non-empty"}

# �˳� shell �󲻹رպ�̨����
shopt +s huponexit
# ������ʹ��
nohup
# ����Ϊʲô�ᱻ�ر� �ο����� http://stackoverflow.com/questions/15595374/

x=123
i=x
echo ${!i} # ʹ�ñ���������ȡ
declare "$i=456" # ���ñ���
declare "$i=456${!i}" # ��ֵ��Ҳ����֮ǰ��ֵ

# �������
array=(a b c d e f g h) # ��������
array+=(A) # ���������
declare -p array # ��ʾ����������
echo ${#array[@]} # ���鳤��
end=(${!array[@]}) # �����������ŵ�����һ������
end=${end[@]: -1}  # ��ȡ���һ��
# ��������
for i in "${array[@]}"
do
	echo bin "$i"
done