SQL Tuning/SQL Optimization Techniques
------------------------------------
http://beginner-sql-tutorial.com/sql-query-tuning.htm

1. The sql query becomes faster if you use the actual columns names in SELECT statement instead of than '*'.
	ʹ�þ��������, ������ `*`
2. HAVING clause is used to filter the rows after all the rows are selected. It is just like a filter. Do not use HAVING clause for any other purposes. 
	`HAVING` ���ֻӦ����������ѯ��Ĺ���, ����Ӧ������������;.����: ��� `WHERE`. Ҳ����˵���� `WHERE` ��ʱ������ `WHERE`
3. Sometimes you may have more than one subqueries in your main query. Try to minimize the number of subquery block in your query. 
	���������Ӳ�ѯ.
4. Use operator EXISTS, IN and table joins appropriately in your query. 
	�����ӱ�ʱ, ���ص�ʹ�� `EXISTS`, `IN`
	- Usually IN has the slowest performance. 
		ͨ�� `IN` ��Ч�����
	- IN is efficient when most of the filter criteria is in the sub-query. 
		���󲿷ֽ������__�Ӳ�ѯ__��ʱ, `IN` ��Ч�ʽϸ�
	- EXISTS is efficient when most of the filter criteria is in the main query.
		���󲿷ֽ������__����ѯ__��ʱ, `EXISTS` ��Ч�ʽϸ�
5. Use EXISTS instead of DISTINCT when using joins which involves tables having one-to-many relationship. 
	��ʹ�ñ�����ʱ, ʹ�� `EXISTS` ����� `DISTINCT` �жϱ�֮��� һ�Զ��ϵ
6. Try to use UNION ALL in place of UNION. 
	����ʹ�� `UNION ALL` ����� `UNION`
7. Be careful while using conditions in WHERE clause. 
8. Use DECODE to avoid the scanning of same rows or joining the same table repetitively. DECODE can also be made used in place of GROUP BY or ORDER BY clause. 
9. To store large binary objects, first place them in the file system and add the file path in the database.
	�洢��Ķ������ļ�ʱ, ���ļ����뵽�ļ�ϵͳ, ֻ�����ݿ��д洢·��.
10. To write queries which provide efficient performance follow the general SQL standard rules.
	- Use single case for all SQL verbs
	- Begin all SQL verbs on a new line
	- Separate all words with a single space 
	- Right or left aligning verbs within the initial SQL verb

MySQL ���ʹ������
==================
http://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html

��������� (`PRIMARY KEY`, `UNIQUE`, `INDEX`, �� `FULLTEXT`) ������ B-trees �洢��. ��һЩ�������ݵ�������ʹ�� R-trees �洢��, �ڴ��ʹ�õ�Hash����.

B-Tree ����������
---------------
ʹ�� B-Tree ������,����֧��  `=, >, >=, <, <=, BETWEEN` �Ƚϲ���.����Ҳ������Ϊ`LIKE`�Ƚ�,����Ҫ������ͨ�����ʼ���ַ���.

Hash ����������
-------------
* ֻ����ʹ��`= , <=>`����
* �Ż�������ʹ��Hash����������`ORDER BY`����.
* MySQL ���ܹ�������ֵ֮���ж�����
* ֻ��ȫ�������������� 
	
����
----
http://jaxenter.com/yet-another-10-common-mistakes-java-developers-make-when-writing-sql-you-won-t-believe-the-last-one-50824.html
http://blog.jooq.org/2013/07/30/10-common-mistakes-java-developers-make-when-writing-sql/
�ڲ�ѯʹ�� `NOT IN` ʱ��Ҫע��,����:
```
SELECT * FROM table
WHERE value NOT IN (
  SELECT nullable_column FROM ...
)
```
����������кܿ���û�з���ֵ,����Ӳ�ѯ�а���`NULL`, ������`NOT IN`��ʧ��.���ܹ����`NOT NULL`����ʱ�������.

���ڴ��ں����Ľ���,�ǳ�Ư��
http://blog.jooq.org/2013/11/03/probably-the-coolest-sql-feature-window-functions/
֧�ֵ����ݿ� CUBRID, DB2, Oracle, PostgreSQL, SQL Server, or Sybase SQL

* ��дSQL��ʱ��Ҫ�������`NULL`ֵ�ò�ѯ�Ƿ���Ч,ʹ�õĺ����Ƿ�`NULL`Ӱ��
* ������Ҫ��Java�ڴ��д�������
* ʹ�þ���`UNION ALL`�����`UNION`
	* `UNION` ���Ƴ��ظ���,��ζ�Ż���кܶ�����ɨ���ظ��еĹ���
* ��Ҫʹ��JDBC�������ݷ�ҳ,ʹ�����ݿ�ķ�ҳ����
* ��Ҫ��Java����������.
* ʹ�� DISTINCT �� UNION���Ƴ��ظ�����
	�ڷ������ظ����ݵ�ʱ��,���������е�Join
* ʹ��`MERGE`���.
* �ڿ��ܵ�ʱ��,����ʹ�ô��ں��������ǾۺϺ���.
	* ���ں����Ŀɶ��Ը���(�Ӳ�ѯ��GROUP BY����)
	* ���ܸ���,RDBMS�Դ��ں����Ż���������
	* �����Ӳ�ѯ��ʹ��`GROUP BY`ʱ,�����ܷ��ô��ں������.
* ��Ҫ���ڴ�������,�����ݿ��в���
* �ڲ���������ݵ�ʱ��,ʹ����������



�ο�
----
* http://beginner-sql-tutorial.com/sql-query-tuning.htm
* http://beginner-sql-tutorial.com/sql-tutorial-tips.htm
* http://msdn.microsoft.com/en-us/library/ff650689.aspx
* PART 1 http://www.codeproject.com/KB/database/OptimizeDBUseIndexing.aspx
* PART 2 http://www.codeproject.com/Articles/35665/Top-steps-to-optimize-data-access-in-SQL-Serv
* http://en.wikipedia.org/wiki/Query_optimization
* http://www.sommarskog.se/dyn-search.html
* http://blog.jooq.org/2013/07/07/high-complexity-and-low-throughput-reasons-for-using-an-orm/