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


�ο�
----
* http://beginner-sql-tutorial.com/sql-query-tuning.htm
* http://beginner-sql-tutorial.com/sql-tutorial-tips.htm
* http://msdn.microsoft.com/en-us/library/ff650689.aspx
* PART 1 http://www.codeproject.com/KB/database/OptimizeDBUseIndexing.aspx
* PART 2 http://www.codeproject.com/Articles/35665/Top-steps-to-optimize-data-access-in-SQL-Serv
* http://en.wikipedia.org/wiki/Query_optimization