# ע�⴦����
lombok.core.AnnotationProcessor
com.mysema.query.apt.jpa.JPAAnnotationProcessor

# java ����ʱ�ĵ��Բ���
-Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=12345

# ���� permSize �Ľ��� http://java.sun.com/docs/hotspot/gc1.4.2/faq.html
The permanent generation is used to hold reflective data of the VM itself such as class objects and method objects. These reflective objects are allocated directly into the permanent generation, and it is sized independently from the other generations.

# ���� java8 �� permSize �ľ���
http://stackoverflow.com/questions/18339707
PermGen space was removed. Memory management has changed a bit.

ReservedCodeCacheSize (and InitialCodeCacheSize) is an option for the (just-in-time) compiler of the Java Hotspot VM. Basically it sets the maximum size for the compilers code cache.

# gc �ĵ���
http://www.oracle.com/technetwork/java/javase/gc-tuning-6-140523.html
# Java HotSpot VM Options
http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html
# �鿴 vm �����Ĺ���
https://visualvm.java.net/
# �ο�
http://stackoverflow.com/questions/1058991/how-to-monitor-java-memory-usage




