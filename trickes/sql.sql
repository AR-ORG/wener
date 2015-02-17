
-- �鿴�û�
SELECT User,host FROM mysql.user; 

-- �����û�
CREATE USER 'wener'@'localhost' IDENTIFIED BY 'qaz';
GRANT ALL PRIVILEGES ON *.* TO 'wener'@'localhost' WITH GRANT OPTION;

-- ����һ������Զ��ʹ�õ��˻�
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
GRANT ALL PRIVILEGES ON cbh.* TO 'root'@'%' identified by 'root' WITH GRANT OPTION;

-- ��������
SET PASSWORD FOR 'root'@'%' = PASSWORD('root');
-- ɾ������
SET PASSWORD FOR 'root'@'%' = PASSWORD('');

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

-- ����ʹ�û���������ָ������,�����������ϵľ���
MYSQL_PWD=$password

-- �鿴��ǰ������
SHOW STATUS WHERE `variable_name` = 'Threads_connected'
show processlist


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
-- �����֪������
select @@datadir;

-- H2 ���������� SQL
script to 'filenam'

-- ======================================
-- === ���ɲ�������
-- ======================================
DROP TABLE IF EXISTS massive;
/* ����������,�������������������ļ� */
CREATE TABLE massive (id int PRIMARY KEY AUTO_INCREMENT, n int, val varchar(40));

-- ʹ����һ��������,���Ӳ�����ٶ�
DROP PROCEDURE IF EXISTS prepare_data;
DELIMITER $$
CREATE PROCEDURE prepare_data (IN n INT)
BEGIN
	DECLARE i INT DEFAULT 0;
	START TRANSACTION;
	WHILE i < n DO
		INSERT INTO massive (n,val) VALUES (i % 200, uuid());
		SET i = i + 1;
	END WHILE;
	COMMIT;
END$$
DELIMITER ;

CALL prepare_data(100);

SHOW CREATE PROCEDURE prepare_data;

-- ������ҪһЩȨ��
GRANT EXECUTE ON PROCEDURE test.* TO ''@'localhost';
flush privileges;
-- ��� binlog
PURGE BINARY LOGS TO 'mysql-bin.010';
PURGE BINARY LOGS BEFORE '2008-04-02 22:46:26';
PURGE BINARY LOGS BEFORE now();

-- FAQ
-- how-to-shrink-purge-ibdata1-file-in-mysql http://stackoverflow.com/questions/3456159/
-- how-do-i-quickly-rename-a-mysql-database-change-schema-name http://stackoverflow.com/questions/67093/
-- �������� http://stackoverflow.com/questions/tagged/mysql?sort=votes

-- Reference
-- MySQL ���ں���
-- http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html
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
