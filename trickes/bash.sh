# download: remote -> local
scp user@remote_host:remote_file local_file 

# local_file ����ΪĿ¼

# upload: local -> remote
scp local_file user@remote_host:remote_file

# �Եڶ�������, �����ֵķ����Ƚ�
sort -n -k 2

# ��ʾ�ڴ漰cpuʹ�����
top -bMmc -d 0.01 |head -20
# M ��λΪ m
# m ��ʾ����ʹ�õ� �����Ǿ����С VIRT
# c ��ʾ������������

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

# ���ô���
export https_proxy=http://192.168.1.103:8087/
export http_proxy=$https_proxy
export ftp_proxy=$https_proxy

# �����ؼ���
echo -e "Wener\nis\ngreate" | grep -i -e "wen\|$" -e "greate\|$"

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


# wget �����ڻ�ȡ googlecode ��Ϊ��ʵ�������ز�����~
# ��Ҫ�������� �Ѿ��� .wgetrc �������˴���
# http://downloadsvn.codeplex.com/ Ҳ������������ svn ���ǲ����ô���
wget ... -e use_proxy=on


wget -m -np http://myproject.googlecode.com/svn/myproject/trunk/
wget --user=yourusername --ask-password -m -np http://myproject.googlecode.com/svn/myproject/trunk/


