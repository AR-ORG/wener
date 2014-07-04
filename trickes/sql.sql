
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

-- MYSQL ��ȡ���ݿ�Ĵ�С
SELECT table_schema                                        "DB Name", 
   Round(Sum(data_length + index_length) / 1024 / 1024, 2) "DB Size in MB" 
FROM   information_schema.tables
GROUP  BY table_schema; 

-- mysql ��������ѯ
-- http://dev.mysql.com/doc/refman/5.1/en/server-system-variables.html#sysvar_slow_query_log_file
-- http://dev.mysql.com/doc/refman/5.6/en/slow-query-log.html
-- �Ѳ���ʹ�� SET GLOBAL log_slow_queries = 1;
-- 5.1.12
SET GLOBAL slow_query_log = 'ON';
FLUSH LOGS;
-- 5.5 �Ժ���
FLUSH SLOW LOGS;
-- ��������ѯ��־�ļ� 5.1.12
SET GLOBAL slow_query_log_file = 'path';
-- �鿴����
SHOW VARIABLES LIKE '%slow_query%'

-- H2 ���������� SQL
script to 'filenam'

-- MySQL ���ں���
-- http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html
-- JPQL ���ں���
-- http://www.datanucleus.org/products/accessplatform_2_2/jpa/jpql_functions.html
-- JPQL �ֲ�
-- http://docs.oracle.com/cd/E17904_01/apirefs.1111/e13946/ejb3_langref.html
-- MySQL ��־˵�� http://dev.mysql.com/doc/refman/5.6/en/server-logs.html

-- �Ż���
-- http://stackoverflow.com/questions/5474662/mysql-optimize-all-tables
-- OPTIMIZE TABLE ����
-- http://dev.mysql.com/doc/refman/5.6/en/optimize-table.html
-- ���Ż�����
-- https://www.digitalocean.com/community/tutorials/how-to-optimize-queries-and-tables-in-mysql-and-mariadb-on-a-vps
-- http://www.openlogic.com/wazi/bid/195905/Tips-and-Tricks-to-Optimize-MySQL