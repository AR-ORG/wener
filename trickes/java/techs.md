��̬����SQL/��������ѯ
-----------------------
http://stackoverflow.com/questions/825141/

* jOOQ: http://www.jooq.org
	��ʹ�ÿ�Դ���ݿ�����ѵ�, Apachev2 Э��.
	CUBRID 8.4
	Derby 10.10
	Firebird 2.5
	H2 1.3
	HSQLDB 2.2
	MariaDB 5.2
	MySQL 5.5
	PostgreSQL 9.0
	SQLite
* QueryDSL: http://www.querydsl.com
	Apachev2
	֧�� JPA,SQL,Mongodb,JDO,Lucene,����,Spatial
* JaQu: http://www.h2database.com/html/jaqu.html
* iciql: http://iciql.com/ (a friendly fork of JaQu)
* Quaere: http://quaere.codehaus.org
* Jequel: http://www.jequel.de (in maintenance mode, I think)
* Squiggle: http://code.google.com/p/squiggle-sql (in maintenance mode, I think)

[JDBI](http://jdbi.org/) ��Ȼ���Ƕ�̬����SQL,���Ǹ���JDBC���в�����,Ҳ�ǳ�����.

ѡ��JAX-RS jsr339
---------------
http://programmers.stackexchange.com/questions/155467/

���������͵Ľ������ Dropwizard 

ϵ�м���ջ

* Jetty (HTTP)
* Jersey (JAX-RS)
* Jackson (JSON or XML)
* Guava (excellent additions to JDK libraries)
* Metrics (real time application monitoring)
* Hibernate Validator (input verification)
* OAuth (RESTful authentication)

���� JAX-RS [restlet](http://www.restlet.org) �Ƿǳ������ѡ��, CXF���������һ��.

restlet
: ���İ�+JAX-RS��Լ1M���� ����������
: ���Ժ�guice����
: [JAX-RSʾ��](http://restlet.com/learn/guide/2.2/extensions/jaxrs)
: û��������ֿ�

CXF
: ���İ�+JAX-RS��Լ1.7M ����������
: �������2.9M,������Jetty
: Ŀǰֻ��ʹ�� Spring

Jersey
: ���İ�+����˰����1.6M ����������

Dropwizard
: ���İ�������,������Լ 9.5M, ���������еĹ���
: Apache License v2
: ֻ��Ҫ����һ������,���������Խ��п���,ʹ�÷ǳ�����,�����һϵ�еĿ��,ʹ�õĶ���Ŀǰ�ȽϺõ�ʵ�ֺͱȽ��µİ汾.�����˺ܶ������ϵ��鷳
: Ҳ������� Guice ʹ�� https://github.com/HubSpot/dropwizard-guice
: JSON ע�� http://wiki.fasterxml.com/JacksonAnnotations
: Bean Validationע��: http://docs.jboss.org/hibernate/validator/5.1/reference/en-US/html_single/#section-builtin-constraints


WebSocket
--------
* �򵥵Ĳ���WebSocket http://www.websocket.org/echo.html
* js��websocket�ͻ��� https://github.com/gimite/web-socket-js
* �򵥵� java WebSocket ʵ�� https://github.com/TooTallNate/Java-WebSocket
	* __�������ڰ�׿��__
* ��ʵ [](http://async-io.org/) ��һ���ǳ�����Ŀ��, ֻ���ƺ����ܲ��������ڰ�׿��






-----

���� jsr-356 WebSocket
https://jsr-chinese.readthedocs.org/en/latest/jsr-356/index.html