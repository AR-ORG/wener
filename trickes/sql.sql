
-- �鿴�û�
SELECT User,host FROM mysql.user; 

-- �����û�
CREATE USER 'wener'@'localhost' IDENTIFIED BY 'qaz';
GRANT ALL PRIVILEGES ON *.* TO 'wener'@'localhost' WITH GRANT OPTION;

-- ����һ������Զ��ʹ�õ��˻�
CREATE USER 'wendb'@'%' IDENTIFIED BY 'wendb';
GRANT ALL PRIVILEGES ON cbh.* TO 'wendb'@'%' identified by 'wendb' WITH GRANT OPTION;

-- ʹȨ����Ч
FLUSH PRIVILEGES;

-- �����ṹ��ͬ�ı�
create table name like old_tab;
create table name select * from old_tab where 1=2;