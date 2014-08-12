JVM����ʱ������, �������Ͷ��������̹߳���,�������̸߳����������

* ������ Method Area
	- ��ű���������ص�����Ϣ,����,��̬����,JIT��Ĵ��������
	- �����Ƕ�(Non-Heap)
	- ��HotSpotҲ�ɽ����ô�(Permanent Generation),
		����˵��ʹ�����ô���ʵ�ַ�����.
	- GC ���������������,����Ŀ����Ҫ�ǳ����ػ��պ���ж��.������������
	- �޷�����������׳�OOME
* �� Heap
	- ��Ŷ���ʵ��
	- ����ʱ����
	- GC ����ҪĿ��
* �����ջ VM Stack
	- �����������߳���ͬ
	- �������� Java ����ִ�е��ڴ�ģ��
	- �洢��ջ֡
* ���ط���ջ Native Method Stack
	- �������ջ����,����Ϊ����(Native)��������
* ��������� Program Counter Register
	
ջ֡(Stack Frame)
: ÿ������ִ��ʱ����
: �������ڵĻ������ݽṹ
: ���ڴ洢�ֲ�������,����ջ,��̬����, �������ڵ�
: �ֲ��������Ŀռ����ڱ�������ɷ����
: ջ��ȹ���,���׳�StackOverflowError
: ���ջ���Զ�̬��չ,���޷����뵽�㹻�ڴ��ǽ��׳�OutOfMemoryError

ֱ���ڴ�(Direct Memory)
: �������������ʱ��������һ����
: ����JVM-SPEC������ڴ�����
: ����,���ܵ���OOME
: DirectByteBuffer
: ��һ��������������,��������Java�Ѻ�Native�������ظ�������
: �ܵ������ڴ漰������Ѱַ�ռ�����,������ʱ���׳�OOEM

������ʷ�ʽ��Ҫ�� _���_ �� _ֱ��ָ��_, HotSpot ʹ�õڶ���


�����ռ��㷨:

	* ���ü���(Reference Counting)
		- ʵ�ּ�,Ч�ʸ�
		- e.g. COM,FlashPlayer,Python,Squirrel
		- ���ѽ��ѭ����������
	* �������㷨(GC Root Tracing)
		- ͨ��һϵ����Ϊ"GC Root"�Ķ�����Ϊ��㿪ʼ��������,��������·��Ϊ������(Reference Chain),��һ������ GC Root û���κ�������ʱ(ͼ������˵�ȴ�GC Root���ɴ�),��֤���ö����ǲ����õ�.
		- e.g. Java,C#,List
		- ��Java��,����ΪGC Root�Ķ���Ϊ���¼���:
			- �����ջ(ջ֡�еı��ر�����)�����õĶ���
			- ��������_��̬����_���õĶ���
			- ��������_����_���õĶ���
			- ���ط���ջ��JNI(Native����)���õĶ���
		- ��JDK 1.2֮ǰ,�����õĶ���ܴ�ͳ:����������͵������д洢����ֵ�����������һ���ڴ����ʼ��ַ,�ͳ�����ڴ������һ������.
		- JDK 1.2֮��,�����÷�Ϊ:
			- ǿ���� (Strong Reference)
				- ֻҪǿ���û���,GC�Ͳ�����ձ����õĶ���
			- ������ (Soft Reference)
				- ��ʾ���Ǳ���Ķ���
				- �ڷ����ڴ����֮ǰ���������������շ�Χ֮��,���ж��λ���
				- SoftReference ��
			- ������ (Weak Reference)
				- �������õĹ�������ֻ�����浽��һ��GC֮ǰ,�����ڴ��Ƿ��㹻,�������
				- WeakReference ��
			- ������ (Phantom Reference)
				- �����õĴ��ڲ���Ӱ��������ʱ��,�޷�ͨ�������û�ȡ����ʵ��.
				- Ϊ�������������ù�����ΨһĿ����ϣ���ڸö���GC����ʱ�յ�һ��֪ͨ.
				- PhantomReference ��

����ж�һ�������Ƿ�ɻ���:

* ���������ʵ�����Ѿ�������,��Java���в����ڸ�����κ�ʵ��
* ���ظ����ClassLoader�Ѿ�������
* �����Ӧ�� java.lang.Class û�����κεط�������,�޷�ͨ��������ʸ��෽��
				
�����ռ��㷨:

* ���-���(Mark Sweep)
	- ��Ϊ��Ǻ�������׶�: �ȱ����Ҫ���յĶ���,�����ɺ�ͳһ���յ�����Ƕ���.
	- ȱ��
		- Ч�ʵ�.��Ǻ������Ч�ʶ�����
		- �ռ�����.�������������������������ڴ���Ƭ,��������Ҫ���������ǿ��ܻ�ʧ��,�����ٴ�GC.
* �����㷨(Copying)
	- �������ڴ水��������Ϊ��ȴ�С������,ÿ��ֻʹ������һ��.�����������,�ͽ������Ķ����Ƶ�����һ����,Ȼ����ʹ�ù��Ŀռ�һ�������.
	- ʵ�ּ�,���и�Ч,�����ڴ����.
	- ���������ֻ���������������,��Ϊ��������඼�ǳ���Ϧ���Ķ���.
	- ���ڴ��Ϊһ��ϴ��Eden�ռ�������С��Survivor�ռ�,ÿ��ʹ��Eden������һ��Survivor.
	- ����ʱ,��Eden��Survivor���Ķ��󿽱�������һ��Survivor�ռ�,����Eden�͸ղŵ�Survivor.
	- HotSpotĬ��Eden��Survivor�Ĵ�С������ 8:1, �����������ÿռ�Ϊ90%,��һ��Survivorֻ��10%�ռ�.
	- ���Survivor�ռ䲻��,��ͨ�����䵣������(Handle Promotion)���������.
* ���-�����㷨
	- ����������Ķ�����ʱ��ϳ�,��������
	- �����д���Ķ�����һ���ƶ�,ֱ��������˱߽�������ڴ�.
* �ִ��ռ��㷨
	- ���ݶ���Ĵ�����ڲ�ͬ���ڴ滮��Ϊ����.
	- ���ݸ�������Ĳ�ͬ,�������ʺϵ��ռ��㷨.
	
GC
===

�����ռ���,���ڴ���յľ���ʵ��.
������(Young Generation)�������(Tenured Generation)�ռ�������Ϲ�ϵ.
����ɲο�: https://blogs.oracle.com/jonthecollector/entry/our_collectors
![ͼ](https://blogs.oracle.com/jonthecollector/resource/Collectors.jpg)

Serial/ParNew
	-> CMS -> Serial Old(MSC)
	-> Serial Old(MSC)
Parallel Scavenge
	-> Parallel Old
	-> Serial Old(MSC)

�������ռ����������������� ����(Parallel) vs ����(Concurrent)

* ����ָ���������ռ������й���,�û�������Ȼ���ڵȴ�״̬.
* ����ֵ�û��߳��������ռ��߳�ͬʱִ��,�û������������.


Serial
-----
* JDK 1.3.1 ֮ǰ��������Ψһѡ��
* �򵥸�Ч
* ��ֻ�е���CPU�Ļ�����,�������Ч��
* �� Client ģʽ�µ�Ψһѡ��
* ���߳�
* ִ��ʱ����ֹͣ���������߳�
* ���Ʋ����� SurvivorRatio,PretenureSizeThreadhold,HandlePromotionFailure ��

ParNew
------
* Serial�Ķ��̰߳汾
* ��Serial����ͬ�Ŀ��Ʋ���,�ռ��㷨,Stop the World,����������,���ղ���
* ��������� Server ģʽ���������ѡ���������ռ���
* Ŀǰֻ��������CMS�ռ������
* ParNew �ڵ�CPU�����о��Բ����б�Serial���õ�Ч��.
* ʹ�� ParallelGCThreads �����߳�����

Parallel Scavenge
----------------

* �������ռ���
* ʹ�ø����㷨
* �����ռ���
* ��ҪĿ���Ǵﵽһ���ɿ��Ƶ�������(Throughout)
* ������=�����û�����ʱ��/(�����û�����ʱ��+�����ռ�ʱ��)
* ͣ��ʱ��Խ��Խ�ʺ���Ҫ���û������ĳ���,����û�����;��������������Ч������CPUʱ��,������ɳ������������,�ʺ��ں�̨���������Ҫ̫�ཻ��������.
* ��Ҫ���� MaxGCPauseMillisͣ��ʱ��, GCTimeRatio��������С
* ���������ȵ��ռ���.
* UseAdaptiveSIzePolicy����Ӧ��С���� 
	- �򿪺���Ҫ�ֹ�ָ��
		- �������Ĵ�С(-Xmn)
		- Eden��Survivor����(-XX:SurvivorRatio)
		- �����������������(-XX:PretenureSizeThreshold)
	- VM��������ʱ���ܼ����Ϣ,��̬��������,���ṩ���ʺϵ�ͣ��ʱ���������,�����ĵ��ڷ�ʽ��Ϊ GC����Ӧ���ڲ���(GC Ergonomics)
	
Serial Old
---------
* Serial ��������汾
* ���߳��ռ���
* ���-�����㷨
* ��Ҫ��Clientģʽ��ʹ��
* ��Server��,��JDK1.5֮ǰ�汾����Parallel Scavenge����,��ΪCMS�ĺ�Ԥ��

Parallel Old
-----------
* Parallel Scavenge ��������汾
* ���߳�
* ���-�����㷨
* JDK 1.6 ��ʼ,����֮ǰ���������ѡ�� Parallel Scavenge,�������ֻ��ѡ��Serial Old

CMS(Concurrent Mark Sweep)
-------
* Ŀ��: ��̻���ͣ��ʱ��
* ���ӷ������Ӧ
* ���-���
* �����ռ�,��ͣ�� (Concurrent Low Pause Collector)
* ����
	- ��ʼ���(initial mark)
		- ��Ҫ Stop the World
		- �����GC Root��ֱ�ӹ������Ķ���,�ٶȿ�
	- �������(concurrent mark)
		- ����GC Root Tracing �Ĺ���
	- ���±��(remark)
		- ��Ҫ Stop the World
		- ������������ڼ�,���û��������ж����±�ǲ����䶯���ֶ���ı�Ǽ�¼
		- ʱ��ȳ�ʼ����Գ�,Զ�Ȳ�����Ƕ�
	- �������(concurrent sweep)
* ȱ��
	- ��CPU��Դ�ǳ�����
		- Ĭ���߳���Ϊ (CPU��+3)/4
		- ��CPU����4��ʱ,���û������Ӱ����ܱ��,�����û�����ִ���ٶ�ͻȻ����50%
		- ����� ����ʽ�����ռ���(Incremental Concurrent Mark Sweep/i-CMS)
			- �ڲ�����ǺͲ������ʱ��GC�̺߳��û��߳̽�������,����GC��ռʱ��
			- �ռ����̸������ǶԳ���Ӱ����һЩ
			- �÷����ѱ�__����__
		- �޷�����������(Floating Garbage),���ܳ���"Concurrent Mode Failure",�Ӷ�������һ��Full GC
			- ��CMS��ǽ׶�,�û�����Ҳ������,�ڱ�Ǻ������������,ֻ��������һ��GC����,��һ���ֳ�Ϊ_��������_
			- �����������������Ĳ���,���Ե���`CMSInitiatingOccupancyFraction`�������ڴ���մ���,��ȡ��������.
			- ��CMS�����ڼ�Ԥ�����ڴ治�����������Ҫ,�����"Concurrent Mode Failure",��ʱ����Serial Old������������ռ�
			- ���ߵ�`CMSInitiatingOccupancyFraction`�ᵼ�´�����"Concurrent Mode Failure",Ӱ������
		- ��ΪCMS�ǻ��� ���-��� ��,�ռ�����ʱ���ܲ��������ռ���Ƭ.
			- ���޷��Ҵ��㹻��Ŀռ�������ʱ��ᴥ��һ��Full GC
			- ����ʹ��`-XX:+UseCMSCompactAtFullCollection`����,�����Full GC�����һ����Ƭ�������.
			- �ڴ�����������޷�������
			- ����ʹ��`-XX:CMSFullGCsBeforeCompaction`����,�����ڽ��ж��ٴβ���ѹ����Full GC��ִ��һ�δ�ѹ����.
G1
===
* ���-���� ���в������ռ���Ƭ,���ڳ������е�Ӧ�÷ǳ���Ҫ.
* ���Ծ�ȷ�Ŀ���ͣ��,��ͣ��ʱ�������һ����Χ��,����Java(RTSJ)�����ռ���������
* ������Java�ѻ���Ϊ�����С�̶��Ķ�������,������Щ�����������Ķѻ��̶�,��̨ά��һ�������б�,ÿ�θ���������ռ�ʱ��,���Ȼ���������������(Garbage First���ֵ�����).�������Ի����ߵ��ռ�Ч��

���������
---------
* ����������Eden����,��û���㹻�ռ��ʱ��,����һ��MinorGC
* �����ֱ�ӽ��������
	- `-XX:PretenureSizeThreshold`�����жϴ����Ĵ�С,ֻ��Serial��ParNew��Ч
	- ������Eden��Survivor֮�䷢���������ڴ濽��
* ���ڴ�������������
	- �������ÿ�������и�����Ķ���
		- ��Eden���������һ��MinorGC����,�ұ�Survivor����,����Ϊ1
		- ��Survivor����ÿ����һ��MinorGC �����1
	- �������ӵ�һ���̶Ⱥ���������,Ĭ��15
		- �������ͨ��`-XX:MaxTenuringTheshold`����
* ��̬���������ж�
	- Ϊ����Ӧ�ڴ�״��,�����Ǳ���Ҫ������ﵽ`MaxTenuringTheshold`���ܽ��������
	- �����Survivor����ͬ�������ж����С���ܺʹ���Survivor�ռ��һ��,������ڵ��ڸ�����Ķ���ֱ�ӽ��������
* �ռ���䵣��
	- �ڷ���MinorGCʱ,VM���֮ǰÿ�ν����������ƽ����С�Ƿ���������ʣ��ռ��С
		- �������,�����FullGC
		- ���С��,��鿴`HandlePromotionFailure`�Ƿ�������ʧ��
			- �������,��ֻ����MinorGC
			- �������FullGC


MinorGC
: �������������������ռ�����
: Ƶ��,�����ٶȿ�

FullGC/MajorGC
: �����������
: ����MajorGCͨ����������һ�ε�MinorGC(���Ǿ���,ParallelScavenge��ָ��Major GC����ѡ��).
: ��MinorGC��10������

��
====
* ��Ҫ��Ŷ���ʵ��������
* ���ڴ�,�����ϲ�һ������
* ʹ�� -Xmx��-Xms����
* �������û�����ʵ������,���޷�����,�׳�OutOfMemoryError


����
----
����ϸ����Ϊ�˸��õĻ���,����ķ���

* ������
* �����
* ���ô�

Eden
From Survivor
To Survivor

�̹߳���Ķ��п��ܻ��ֳ�����߳�˽�еķ��仺����(Thread Local Allocation Buffer, TLAB)


������
=====
����ʱ������
-----------
��������һ����
Class�еĳ��������ڴ�ű��������ɵĸ����������ͷ�������,������غ��ŵ�����ʱ������
�߱���̬����,������ʱ����,����String#intern


JDK ����
=======

> __ע��__: ��ʹ����Щ����ʱ,��Ҫȷ��ʹ�õ��Ǻ�Ŀ�������ͬ��VM,������׳�`java.lang.reflect.InvocationTargetException`

��Щ������Ҫ��������ʱ�������:������־,�쳣��ջ,GC��־,�߳̿���(threaddump/javacore),��ת������(heapdump/hprof)��.

�󲿷�jdk�Դ��Ĺ��߶��Ƚ�С,��Ϊ��Ҫ��ʹ�õ�`tools.jar`����Ľӿ���ɵ�.�ÿⲻ��Java�ı�׼API,�������ʹ��,��ֻ��������HotSpot(��һЩ��Sun����JDKԴ��License�������,��IBMJ9, BEA JRockit)��,�����ڲ���ʱ��Ҫһ����`tools.jar`.

���ڲ���ϵͳ��ͬ,��������Ĳ�����ΪҲ��ͬ.
���������JDK 1.5֮��,��Ҫ������ʱ���`-Dcom.sun.management.jmxremote`����JMX������.

��غ͹��ϴ������б�

����|����
-|-
jps| JVM Process Status Tool,��ʾָ��ϵͳ�����е�HotSpot���������
jstat| JVM Statustics Monitoring Tool,�����ռ�HotSpot��������������������
jinfo| Configuration Info for Java, ʵʱ�Ĳ鿴�͵���������������
jmap| Memory Map for Java, ������������ڴ�ת������(heapdump�ļ�)
jhat| JVM Heap Dump Browser,����heapdump�ļ�,�Ὠ��һ��HTTP/HTML����,���û���������ϲ鿴���.
jstack| Stack Trace for Java, ��ʾ��������߳̿���

jps
----
http://docs.oracle.com/javase/8/docs/technotes/tools/windows/jps.html


ѡ��|����
-|-
-q| ֻ���LVMID
-m| ������������ʱ���ݸ�����main()�Ĳ���
-l| �������ȫ��,�����jar��,���jar·��
-v| ������������ʱJVM����
-V| Suppresses the output of the class name, JAR file name, and arguments passed to the main method, producing only a list of local JVM identifiers.

�����ʽ
: `lvmid [ [ classname | JARfilename | "Unknown"] [ arg* ] [ jvmarg* ] ]`
: �ø�ʽ������δ���ı�,û��Ҫȥ����


jstat
-----
��������ʾ���ػ�Զ��������е������,�ڴ�,�����ռ�,JIT�������������,��û��GUIʱ����ѡ����.

### ѡ��

-class
: ��ʵ��װ��,ж������,�ܿռ估��װ�����ķѵ�ʱ��

-gc
: ����Java��״��,����Eden��,2��Survivor��,�����,���ô�������,���ÿռ�,GCʱ��ϼƵ���Ϣ

-gccapacity
: ��`-gc`������ͬ,�������Ҫ��עJava�Ѹ�������ʹ�õ���������С�ռ�

-gcutil
: ��`-gc`������ͬ,�������Ҫ��ע��ʹ�ÿռ�ռ�ܿռ�İٷֱ�

-gccause
: ��`-gcutil`��ͬ,�������������һ��GC������ԭ��

-gcnew
: ������GC״��

-gcnewcapacity
: ��`-gcnew`������ͬ,���ʹ�õ���������С�ռ�

-gcold
: ������GC״��

-gcoldcapacity
: ��`-gcold`������ͬ,���ʹ�õ���������С�ռ�

-gcpermcapacity
: ������ô�ʹ�õ���������С�ռ�

-compiler
: ���JIT������������ķ���,��ʱ����Ϣ

-printcompilation
: ����Ѿ���JIT����ķ���

-gcmetacapacity
: JDK8

jmap
---
�����ܻ�ȡת���ļ�,�����Բ�ѯfinalizeִ�ж���,Java�Ѻ����ô�����ϸ��Ϣ,��ռ�ʹ����,��ǰ�õ��������ռ�����.

-dump
: ����Java��ת������.��ʽΪ: `-dump:[live,]format=b,file=<filename>`,����live˵���Ƿ�ֻdump�����Ķ���

-finalizerinfo
: ��ʾ��F-Queue�еȴ�Finalizer�߳�ִ��finalize�����Ķ���.

-head
: ��ʾJava����ϸ��Ϣ,��ʹ�����ֻ�����,��������,�ִ�״����.

-histo
: ��ʾ���ж���ͳ����Ϣ,������,ʵ�������ͺϼ�����

-permstat
: ��ClassLoaderΪͳ�ƿھ���ʾ�����ڴ�״̬.

-F
: ����������̶�-dumpû����Ӧʱ,����ʹ�����ѡ��ǿ������ת������.

jhat
----
��Ҫ��������jmap���ɵĶ�ת������.

jstack
-----
���������������ǰʱ�̵��߳̿���(threaddump��javadcore�ļ�).�߳̿��վ��ǵ�ǰ�������ÿһ���߳�����ִ�еķ�����ջ�ļ���,��Ҫ���ڶ�λ�̳߳��ֳ�ʱ��ͣ�ٵ�ԭ��.

��ʹ��JDK1.5��java.lang.Thread#getAllStackTrace��ɸ�����󲿷ֹ���


ѡ��|˵��
-|-
-F|��������������󲻱���Ӧʱ,ǿ������̶߳�ջ.
-l|��ʾ���ĸ�����Ϣ
-m|������ñ��ط����Ļ�,������ʾC/C++�Ķ�ջ

�ڴ���
: �൱�ڿ��ӻ��� jstat
: ���ڼ������ռ��������������ڴ�(�Ѻ����ô�)�仯����

�̼߳��
: �൱�ڿ��ӻ��� jstack

VisualVM
--------
* ��ʾ��������̼����̵����úͻ�����Ϣ(jps,jinfo)
* ��Profilingʱ,�ɿ��ǹر��๲��`-Xshard:off`,�������

jstatd
------
���JVM,����Զ�̶Ը�JVM���м��.

����jstatd��һ�νű�,��ֱ����������Ȩ��
```
#!/bin/sh
policy=${HOME}/.jstatd.all.policy
[ -r ${policy} ] || cat >${policy} <<'POLICY'
grant codebase "file:${java.home}/../lib/tools.jar" {
permission java.security.AllPermission;
};
POLICY

jstatd -J-Djava.security.policy=${policy} -J-Djava.rmi.server.hostname=`hostname`  &
```

### ��ȫ

### ѡ��

-nr
: ��û���ҵ��Ѿ����ڵ�RMIע��ʱ,�������µ�RMIע��.

-p port
: ָ��RMIע��˿�

-n rminame
: �󶨵�RMI���������,Ĭ��ΪJStatRemoteHost,�����ͬһ�����������˶��jstatd����,��ͨ���ò���ָ��Ψһ������.

Զ�̵���
=======

JDK 1.3�����
`-Xnoagent -Djava.compiler=NONE -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=6006`

JDK 1.4
`-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=6006`

֮���JDK
`-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=6006`


Զ�̼��
=======

��Windows��,��Ҫ��TempĿ¼����Ϊϵͳ����,����NTFS.���ڰ�ȫ����.

ֱ�ӿ��õ�,������ȫ����������

```
java -Dcom.sun.management.jmxremote \
     -Dcom.sun.management.jmxremote.port=9191 \
     -Dcom.sun.management.jmxremote.authenticate=false \
     -Dcom.sun.management.jmxremote.ssl=false \
     -Djava.rmi.server.hostname=`hostname` \
     -jar app.jar
```

������֤
-------
### ʹ��LDAP��֤

ldap.config����
```
ExampleCompanyConfig {
    com.sun.security.auth.module.LdapLoginModule REQUIRED
        userProvider="ldap://example-ds/ou=people,dc=examplecompany,dc=com"
        userFilter="(&(uid={USERNAME})(objectClass=inetOrgPerson))"
        authzIdentity=monitorRole;
    };
```
ʾ����������
```
java -Dcom.sun.management.jmxremote.port=5000
     -Dcom.sun.management.jmxremote.login.config=ExampleCompanyConfig
     -Djava.security.auth.login.config=ldap.config
     -jar MyApplication.jar
```

### ʹ�û����ļ���������֤


���õ��û�����,��`JRE_HOME/lib/management`Ŀ¼��

1. ���� jmxremote.password.template Ϊ jmxremote.password
2. �����ļ�Ȩ��,ֻ�����������ܶ�д�ļ�
3. ����ɫ�������,����monitorRole��controlRole
4. ����ڶ��û�������,����Ҫ
	* ������ʱ���� `com.sun.management.jmxremote.password.file=pwFilePath` ����
	
Out-of-the-Box Monitoring and Management Properties
-----------------------------------------------

com.sun.management.jmxremote=true
: ����JMXԶ�̴���ͱ��ؼ��,ͨ��JMX�����ṩJConsole���������ص�JMX�ͻ���ʹ�õĽӿ�.

com.sun.management.jmxremote.port=portNumber
: ����JMXԶ�̴���,����һ��Զ��JMX������������ָ���Ķ˿�.

com.sun.management.jmxremote.registry.ssl=false
: ͨ��SSL��RMI

com.sun.management.jmxremote.ssl=true
: ����SSL

com.sun.management.jmxremote.ssl.enabled.protocols=SSL/TLS
: ���ŷָ���֧�ֵ�SSL/TLSЭ��汾.���`com.sun.management.jmxremote.ssl`ʹ��

com.sun.management.jmxremote.ssl.enabled.cipher.suites
: A comma-delimited list of SSL/TLS cipher suites to enable. Used in conjunction with com.sun.management.jmxremote.ssl.

com.sun.management.jmxremote.ssl.need.client.auth=true
: ����ò�����`com.sun.management.jmxremote.ssl`ͬΪtrue,���ʵ�пͻ�����֤.

com.sun.management.jmxremote.authenticate=true
: If this property is false then JMX does not use passwords or access files: all users are allowed all access.

com.sun.management.jmxremote.password.file=JRE_HOME/lib/management/jmxremote.password
: Specifies location for password file. If com.sun.management.jmxremote.authenticate is false, then this property and the password and access files are ignored. Otherwise, the password file must exist and be in the valid format. If the password file is empty or nonexistent, then no access is allowed.

com.sun.management.jmxremote.access.file=JRE_HOME/lib/management/jmxremote.access
: Specifies location for the access file. If com.sun.management.jmxremote.authenticate is false, then this property and the password and access files are ignored. Otherwise, the access file must exist and be in the valid format. If the access file is empty or nonexistent, then no access is allowed.

com.sun.management.jmxremote.login.config
: Specifies the name of a Java Authentication and Authorization Service (JAAS) login configuration entry to use when the JMX agent authenticates users. When using this property to override the default login configuration, the named configuration entry must be in a file that is loaded by JAAS. In addition, the login modules specified in the configuration should use the name and password callbacks to acquire the user's credentials. For more information, see the API documentation for javax.security.auth.callback.NameCallback and javax.security.auth.callback.PasswordCallback.



������ʶ��/Host Identifier
------------------------
��jps�о�Զ�̷���ʱ,��ҪԶ�̻�����������jstatd����

* LVMID(Local Vitural Machine Identifier)
* VMID��ʽ: `[protocol:][//]lvmid[@hostname[:port]/servername]`
* ���ڱ���,LVMID��VMID��һ�µ�
* ���ڱ����������˵,LVMID�����ϵͳ����IDһ��


��ʽ`[protocol:][[//]hostname][:port][/servername]`

* protocol
	- ���protocol��hostname��ʡ��,��Ĭ�ϵ�Э����ƽָ̨����,�Ż���,����Э��.
	- ���protocolʡ��,hostname����,��Ĭ��Э��Ϊ`rmi`
* hostname
	- ��������IP��ַ.���δָ�����Ǳ�������
* port
	- ���hostnameʡ�Ի�ָ��protocolΪ����Э��,��ò���ʡ��
* servername
	- �ò����������ɾ���ʵ�־���
	- �����Ż���ı���Э��,�ò���������
	- ����`rmi`Э��,�ò�����Զ��RMI���������.
		- ʹ��`jstatd -n`�鿴������Ϣ


Java��ض˿�
=========

�˿�|˵��
-|-
1099|RMIĬ�϶˿�
7000|jhat������web����˿�

JDK8
=====

PermGen to MetaSpace
------------------

	
Metaspace��ʲô
: �µ��ڴ�ռ�
: ʹ�ñ����ڴ������class�ļ�Ԫ����,���Խ�`Metaspace`, ��Oracle JRockit �� IBM JVM����
: ���ٻ���`java.lang.OutOfMemoryError: PermGen`,Ҳ����Ҫ�����ô����е���.
: �Ƴ���һЩ���е���������,���ܻᷢ�ֶ���������
: ��PermGen�����
: �ɶ�̬��չ
: ���Ʋ��� MaxMetaspaceSize
: Ĭ�����Metaspace�Ŀռ���û�����Ƶ�,ֻ�ܵ������ڴ�����.
: �ڴﵽ������ƺ��׳�`java.lang. OutOfMemoryError: Metadata space`
: ÿ�ζ�̬��չǰ�����GC

* �ϳ� PermSize �� MaxPermSize ����

HotSpot JVM ѡ��
========

ѡ���Ĭ��ֵ
: �汾ƽ̨����Ĭ��ֵ
: ����
: �ο�

�汾ƽ̨����Ĭ��ֵ
: +6 Ϊ�ڰ汾 6 �Ժ�����ò���
: -1.4.2 Ϊ�ڰ汾 1.4.2 ���Ƴ��˸ò���
: Solaris,Linux Ϊֻ��Ը�ƽ̨
: (5.0֮ǰ: false) �ڸ������µ�Ĭ��ֵ

���µ�Ĭ��ֵΪJava SE6��Solaris Sparc �� `-server`������Ĭ��ֵ.

* ��������ѡ��: `-XX:+<option>`����, `-XX:-<option>`�ر�
* ��������ѡ��: `-XX:<option>=<number>`.���ֿɴ�`mMkKgG`����ʾ��С.
* �ַ�����ѡ��: `-XX:<option>=<string>`,ͨ������ָ���ļ�,·��������.

����ѡ���д�`manageable`�Ŀ���ͨ��JDK�Ĺ���ӿ�(com.sun.management.HotSpotDiagnosticMXBean API)���ж�̬�޸�,Ҳ��ͨ��JConsole�޸�.�ڼ�غ͹���JavaSE6ʱ,`manageable`��ѡ��Ҳ��ͨ��`jinfo -flag`������.

һ��ѡ����Ҫ����JDK7��֮ǰ�İ汾,����JDK8,�����
* [Windows](http://docs.oracle.com/javase/8/docs/technotes/tools/windows/java.html)
* [Solaris](http://docs.oracle.com/javase/8/docs/technotes/tools/unix/java.html)
* [Linux](http://docs.oracle.com/javase/8/docs/technotes/tools/unix/java.html) 
* [Mac OS X](http://docs.oracle.com/javase/8/docs/technotes/tools/unix/java.html)

��Ϊѡ��
-------
-XX:-AllowUserSignalHandlers
: Solaris,Linux
: Do not complain if the application installs signal handlers.
: ����Ӧ��װ���źŴ���

-XX:AltStackSize=16384
: -5.0,Solaris
: Alternate signal stack size (in Kbytes).
: �滻�ź�ջ��С(��λ Kbytes)

-XX:-DisableExplicitGC
: By default calls to System.gc() are enabled (-XX:-DisableExplicitGC). Use -XX:+DisableExplicitGC to disable calls to System.gc(). Note that the JVM still performs garbage collection when necessary.
: ������ʽ��`System.gc()`����,Ĭ�Ϲر�

-XX:+FailOverToOldVerifier
: +6
: Fail over to old verifier when the new type checker fails. 
: ���µ����ͼ����ʧ��ʱ,ʹ�þɵ�У����

-XX:+HandlePromotionFailure
:  +1.4.2u11 (5.0֮ǰ: false)
:  The youngest generation collection does not require a guarantee of full promotion of all live objects. 

-XX:+MaxFDLimit
: Solaris
: Bump the number of file descriptors to max

-XX:PreBlockSpin=10
:  +1.4.2
: Spin count variable for use with -XX:+UseSpinning. Controls the maximum spin iterations allowed before entering operating system thread synchronization code. 

-XX:-RelaxAccessControlCheck
: +6
: Relax the access control checks in the verifier. 
: ��У�����з��ɶԷ�������ļ�� 

-XX:+ScavengeBeforeFullGC
:  +6
: Do young generation GC prior to a full GC.
: ��FullGCǰ����������һ��GC

-XX:+UseAltSigs
: +1.3.1u9,1.4.1, Solaris
: Use alternate signals instead of SIGUSR1 and SIGUSR2 for VM internal signals

-XX:+UseBoundThreads
: Solaris
: Bind user level threads to kernel threads. 

-XX:-UseConcMarkSweepGC
: +1.4.1
: Use concurrent mark-sweep collection for the old generation.
: �������ʹ�ò������GC�ռ�
: ʹ��ParNew + CMS + Serial Old

-XX:+UseGCOverheadLimit
: +6
: Use a policy that limits the proportion of the VM's time that is spent in GC before an OutOfMemory error is thrown.

-XX:+UseLWPSynchronization
: +1.4.0, Solaris
: Use LWP-based instead of thread based synchronization. 
: ʹ�û���LWP��ͬ�������ǻ����̵߳�

-XX:-UseParallelGC
: +1.4.1
: Use parallel garbage collection for scavenges. 
: ʹ�ò���GC�ռ���
: ʹ��Parallel Scavenge + Serial Old


-XX:-UseParallelOldGC
: +5.0u6
: Use parallel garbage collection for the full collections. Enabling this option automatically sets -XX:+UseParallelGC. 
: ��FullGCʱ,ʹ�ò���GC�ռ���.������`-XX:+UseParallelGC`ʱ���Զ����øò���.
: ʹ��Parallel Scavenge + Parallel Old

-XX:-UseSerialGC
: +5.0
: Use serial garbage collection. 
: ʹ�ô���GC�ռ���
: �򿪺�ʹ�� Serial+Serial Old���ռ�����Ͻ����ڴ����

-XX:-UseSpinning
: 1.4.2 - 5.0 (1.4.2, multi-processor Windows platforms: true)
: Enable naive spinning on Java monitor before entering operating system thread synchronizaton code. 

-XX:+UseTLAB
: +1.4.0, ����֮ǰΪ`UseTLE` (1.4.2��֮ǰ, x86��`-client`: false)
: Use thread-local object allocation
: ʹ���߳�˽�з���

-XX:+UseSplitVerifier
: +5.0(5.0: false)
: Use the new type checker with StackMapTable attributes. 

-XX:+UseThreadPriorities
: Use native thread priorities.
: ʹ�ñ����߳�����

-XX:+UseVMInterruptibleIO
: +6,Solaris
: Thread interrupt before or with EINTR for I/O operations results in OS_INTRPT. 


Garbage First (G1) �����ռ���ѡ��
-----------------------------

-XX:+UseG1GC
: Use the Garbage First (G1) Collector
: ʹ��G1�ռ���

-XX:MaxGCPauseMillis=n
: Sets a target for the maximum GC pause time. This is a soft goal, and the JVM will make its best effort to achieve it.
: ���GCֹͣʱ��

-XX:InitiatingHeapOccupancyPercent=45
: Percentage of the (entire) heap occupancy to start a concurrent GC cycle. It is used by GCs that trigger a concurrent GC cycle based on the occupancy of the entire heap, not just one of the generations (e.g., G1). A value of 0 denotes 'do constant GC cycles'.

-XX:NewRatio=2
: Ratio of old/new generation sizes.
: �����/�������Ĵ�С����.

-XX:SurvivorRatio=8
: Ratio of eden/survivor space size.
: eden/survivor �ռ�ı���.

-XX:MaxTenuringThreshold=15
: Maximum value for tenuring threshold.

-XX:ParallelGCThreads=n
: Ĭ��ֵ��ƽ̨��JVM����
: Sets the number of threads used during parallel phases of the garbage collectors.

-XX:ConcGCThreads=n
: Ĭ��ֵ��ƽ̨��JVM����
: Number of threads concurrent garbage collectors will use.

-XX:G1ReservePercent=10
: Sets the amount of heap that is reserved as a false ceiling to reduce the possibility of promotion failure.

-XX:G1HeapRegionSize=n
: The default value of this parameter is determined ergonomically based upon heap size. Range(1Mb-32Mb).
: With G1 the Java heap is subdivided into uniformly sized regions. This sets the size of the individual sub-divisions. 
: ��ʹ��G1ʱ,�ѻᱻ��Ϊ�����ͬ��С��������.�ò����������õ���������Ĵ�С.

����ѡ��
-------

-XX:+AggressiveOpts
: +5.0u6
: Turn on point performance compiler optimizations that are expected to be default in upcoming releases. 

-XX:CompileThreshold=10000
: (-client: 1,500)
: Number of method invocations/branches before compiling

-XX:LargePageSizeInBytes=4m
: +1.4.0u1 (amd64: 2m)
: Sets the large page size used for the Java heap. 
: ����Java�ѵ�ҳ��С

-XX:MaxHeapFreeRatio=70
: Maximum percentage of heap free after GC to avoid shrinking.
: ��GC��������жѿռ����,���ڱ���������.

-XX:MaxNewSize=size
: (1.3.1 Sparc: 32m; 1.3.1 x86: 2.5m.)
: Maximum size of new generation : (in bytes). Since 1.4, MaxNewSize is computed as a function of NewRatio. 
: �����ɵ���С�ռ�(��λbytes).��1.4��,`MaxNewSize`��ֵʹ��`NewRatio`������

-XX:MaxPermSize=64m
: 5.0 and newer: 64 bit VMs are scaled 30% larger; 1.4 amd64: 96m; 1.3.1 -client: 32m.
: Size of the Permanent Generation.  
: ���ô��Ĵ�С

-XX:MinHeapFreeRatio=40
: Minimum percentage of heap free after GC to avoid expansion.
: ��GC�����С���жѿռ����,���ڱ�����չ��.

-XX:NewRatio=2
: (Sparc -client: 8; x86 -server: 8; x86 -client: 12)-client: 4(1.3), 8(1.3.1+), x86: 12
: Ratio of old/new generation sizes.
: �����/�������Ĵ�С����.

-XX:NewSize=2m
: 5.0+: 64 bit VMs *130%; x86: 1m; x86, 5.0-: 640k
: Default size of new generation (in bytes)
: ��������Ĭ�ϴ�С(��λbytes)

-XX:ReservedCodeCacheSize=32m
: Solaris 64-bit, amd64 -server x86: 2048m; 1.5.0_06-, Solaris 64-bit, amd64: 1024m.
: Reserved code cache size (in bytes) - maximum code cache size.
: �����Ĵ��뻺���С(��λbytes) - �����뻺���С

-XX:SurvivorRatio=8
: Solaris amd64: 6; Sparc 1.3.1: 25; other Solaris platforms in 5.0-: 32
: Ratio of eden/survivor space size
: eden/survivor�ռ��С����

-XX:TargetSurvivorRatio=50
: Desired percentage of survivor space used after scavenge.

-XX:ThreadStackSize=512
: Sparc: 512; Solaris x86: 320  ,5.0-:256; Sparc 64 bit: 1024; Linux amd64: 1024, 5.0-:0; all others 0.
: Thread Stack Size (in Kbytes). (0 means use default stack size)
: �߳�ջ��С(Kbytes),0Ϊʹ��Ĭ��ջ��С

-XX:+UseBiasedLocking
: +5.0u6 (5.0: false)
: Enable biased locking. 
: [tuning example](http://www.oracle.com/technetwork/java/tuning-139912.html#section4.2.5). 

-XX:+UseFastAccessorMethods
: Use optimized versions of Get<Primitive>Field.

-XX:-UseISM
: Solaris
: Use Intimate Shared Memory.
: [Intimate Shared Memory](http://www.oracle.com/technetwork/java/ism-139376.html).

-XX:+UseLargePages
: 5.0u5
: Use large page memory. 
: [Java Support for Large Memory Pages](http://www.oracle.com/technetwork/java/javase/tech/largememory-jsp-137182.html).

-XX:+UseMPSS
: +1.4.0u1, Solaris 9+ (1.4.1-: false)
: Use Multiple Page Size Support w/4mb pages for the heap. Do not use with ISM as this replaces the need for ISM. 

-XX:+UseStringCache
: Enables caching of commonly allocated strings.
: ���ھ���������ַ������û���
 

-XX:AllocatePrefetchLines=1
: Default values are 1 if the last allocated object was an instance and 3 if it was an array. 
: Number of cache lines to load after the last object allocation using prefetch instructions generated in JIT compiled code.
 

-XX:AllocatePrefetchStyle=1
: Generated code style for prefetch instructions.
	0 - no prefetch instructions are generate*d*,
	1 - execute prefetch instructions after each allocation,
	2 - use TLAB allocation watermark pointer to gate when prefetch instructions are executed.
 

-XX:+UseCompressedStrings
: +6u21 Performance Release
: Use a byte[] for Strings which can be represented as pure ASCII. 
 

-XX:+OptimizeStringConcat
: +6u20
: Optimize String concatenation operations where possible. 
: �����Ż��ַ������Ӳ���.

����ѡ��
-------

-XX:-CITime
: +1.4.0
: Prints time spent in JIT Compiler. 
: ���JIT�������ķѵ�ʱ��

-XX:ErrorFile=./hs_err_pid<pid>.log
: +6
: If an error occurs, save the error data to this file. 
: �����������ʱ��,���������ݱ����ڸ��ļ�

-XX:-ExtendedDTraceProbes
: +6,Solaris
: Enable performance-impacting dtrace probes. 

-XX:HeapDumpPath=./java_pid<pid>.hprof
: 1.4.2u12, 5.0u7
: Path to directory or filename for heap dump. Manageable. 

-XX:-HeapDumpOnOutOfMemoryError
: 1.4.2u12, 5.0u7
: Dump heap to file when java.lang.OutOfMemoryError is thrown. Manageable. 
: �Ƿ���`OutOfMemoryError`ʱ,ת���ѵ��ļ�.

-XX:OnError=`"<cmd args>;<cmd args>"`
: 1.4.2u9
: Run user-defined commands on fatal error.
: �ڷ������������ʱ������û�ָ��������.

-XX:OnOutOfMemoryError=`"<cmd args>"`
<cmd args>"
: 1.4.2u12, 6
: Run user-defined commands when an OutOfMemoryError is first thrown. 
: �ڵ�һ���׳�OutOfMemoryErrorʱ,�����û����������

-XX:-PrintClassHistogram
: +1.4.2 jmap -histo�����ṩ�����ƵĹ���
: Print a histogram of class instances on Ctrl-Break. Manageable. 
: �� Ctrl-Break ʱ,���ͳ��ͼ.

-XX:-PrintConcurrentLocks
: +6 jstack -l �ṩ�����ƵĹ���
: Print java.util.concurrent locks in Ctrl-Break thread dump. Manageable. 
: �� Ctrl-Break �߳�ת��ʱ,���java.util.concurrent�µ�����Ϣ.

-XX:-PrintCommandLineFlags
: +5.0
: Print flags that appeared on the command line. 

-XX:-PrintCompilation
: Print message when a method is compiled.
: �������������������Ϣ.

-XX:-PrintGC
: Print messages at garbage collection. Manageable.
: ��GCʱ��������Ϣ.

-XX:-PrintGCDetails
: +1.4.0
: Print more details at garbage collection. Manageable. 
: ��GCʱ�����ϸ��Ϣ.

-XX:-PrintGCTimeStamps
: +1.4.0
: Print timestamps at garbage collection. Manageable 
: ��GCʱ,���ʱ���

-XX:-PrintTenuringDistribution
: Print tenuring age information.

-XX:-PrintAdaptiveSizePolicy
: Enables printing of information about adaptive generation sizing.

-XX:-TraceClassLoading
: Trace loading of classes.
: ���������

-XX:-TraceClassLoadingPreorder
: +1.4.2
: Trace all classes loaded in order referenced (not loaded). 


-XX:-TraceClassResolution
: +1.4.2
: Trace constant pool resolutions. 
: ���ٳ�����

-XX:-TraceClassUnloading
: Trace unloading of classes.
: ������ж��

-XX:-TraceLoaderConstraints
: +6
: Trace recording of loader constraints. 

-XX:+PerfSaveDataToFile
: Saves jvmstat binary data on exit.
: ���˳�ʱ,����jvmstat����

-XX:ParallelGCThreads=n
: Ĭ��ֵ��ƽ̨��JVM����
: Sets the number of garbage collection threads in the young and old parallel garbage collectors.
: ��������������������������ռ����߳���.

-XX:+UseCompressedOops
: Enables the use of compressed pointers (object references represented as 32 bit offsets instead of 64-bit pointers) for optimized 64-bit performance with Java heap sizes less than 32gb.
: ��Java��С��32gb��64λJVM,ʹ��ѹ��ָ��(����������32λ��ʾ,������64λ.).

-XX:+AlwaysPreTouch
: Pre-touch the Java heap during JVM initialization. Every page of the heap is thus demand-zeroed during initialization rather than incrementally during application execution.

-XX:AllocatePrefetchDistance=n
: Ĭ��ֵ��ƽ̨��JVM����
: Sets the prefetch distance for object allocation. Memory about to be written with the value of new objects is prefetched into cache at this distance (in bytes) beyond the address of the last allocated object. Each Java thread has its own allocation point.

-XX:InlineSmallCode=n
: Ĭ��ֵ��ƽ̨��JVM����
: Inline a previously compiled method only if its generated native code size is less than this.
: �����ɵĴ���С�ڸ�ֵʱ,��������.

-XX:MaxInlineSize=35
: Maximum bytecode size of a method to be inlined.
: �����������Ĵ�С.

-XX:FreqInlineSize=n
: : Ĭ��ֵ��ƽ̨��JVM����
: Maximum bytecode size of a frequently executed method to be inlined.

-XX:LoopUnrollLimit=n
: : Ĭ��ֵ��ƽ̨��JVM����
: Unroll loop bodies with server compiler intermediate representation node count less than this value. The limit used by the server compiler is a function of this value, not the actual value.

-XX:InitialTenuringThreshold=7
: Sets the initial tenuring threshold for use in adaptive GC sizing in the parallel young collector. The tenuring threshold is the number of times an object survives a young collection before being promoted to the old, or tenured, generation.

-XX:MaxTenuringThreshold=n
: Sets the maximum tenuring threshold for use in adaptive GC sizing. The current largest value is 15. The default value is 15 for the parallel collector and is 4 for CMS.

-Xloggc:<filename>
: Log GC verbose output to specified file. The verbose output is controlled by the normal verbose GC flags.
: ��¼GC����ϸ�����ָ���ļ�.������ϸ�̶���������������.

-XX:-UseGCLogFileRotation
: Enabled GC log rotation, requires -Xloggc.
: ����GC��־���,��Ҫ`-Xloggc`

-XX:NumberOfGClogFiles=1
: Set the number of files to use when rotating logs, must be >= 1. The rotated log files will use the following naming scheme, <filename>.0, <filename>.1, ..., <filename>.n-1.
: ��������GC��־���ļ���,����>=1,����: <�ļ���>.0, <�ļ���>.1, ..., <�ļ���>.n-1.�ķ�������.

-XX:GCLogFileSize=8K
: The size of the log file at which point the log will be rotated, must be >= 8K.
: ��������GC��־�ļ��Ĵ�С,����>=8k

JVM 1.3.0 ֮ǰ��ѡ��
------------------
��1.3.0֮ǰ,��Solaris�и�Java2SDK�ķ�����ExactVM(EVM).��1.3.0,��Java HotSpot VM ���.

EVNѡ�� | ����| Java HotSpot��ͬѡ��
-|-|-
-Xt|Instruction tracing|None (obsolete option) 
-Xtm|Method tracing|None (obsolete option) 
-Xoss|Maximum java stack size|None (HotSpot doesn't have separate native and Java stacks) 
-Xverifyheap|Verify heap integrity|-XX:+VerifyBeforeGC -XX:+VerifyAfterGC -XX:+VerifyTLE (-XX:+VerifyTLAB in J2SE 1.4) -XX:+VerifyBeforeScavenge -XX:+VerifyAfterScavenge (all debug only) 
-Xmaxjitcodesize|Maximum Comiled code size |-Xmaxjitcodesize<num> (used to be -Xmaxjitcodesize=32m, now -Xmaxjitcodesize32m) 
-Xoptimize|Use optimizing JIT Compiler |-server 
-Xconcgc|Use concurrent garbage collector (1.2.2_07+) | -XX:+UseConcMarkSweepGC (available beginning with J2SE 1.4.1) 


Java HotSpot VM -X ѡ��
---------------
Java HotSpot VM ��ǰ֧������`-X`ѡ��,EVM��֧������ѡ��.

ѡ��|˵��
-|-
-Xincgc|Use Train GC 
-Xnoincgc|Do not use Train Garbage Collection (default) 
-XX:MaxHeapFreeRatio=<Maximum>|heap free percentage (default 70)
-XX:MinHeapFreeRatio=<Minimum>|heap free percentage (default 40)
-Xint|Intepreter only (no JIT Compilation) 
-XX:+UseBoundThreads|Bind user level threads (Solaris only) 
-Xmn<Size>|Set the size of the young generation (available beginning in J2SE 1.4.0)
-XX:+UseParallelGC|Use parallel garbage collection (available beginning in J2SE 1.4.1) 
-XX:+UseAltSigs|On the Solaris operating environment, the VM uses SIGUSR1 by default, which can sometimes conflict with applications that signal-chain SIGUSR1. -XX:+UseAltSigs will cause the VM to use signals other than SIGUSR1 and SIGUSR2 as the default. Available beginning in J2SE 1.4.1 on the Solaris operating environment. 

Java HotSpot VM �� `_JIT_ARGS` ����������ͬ��ѡ��
----------

_JIT_ARGS |	HotSpot ѡ��|����
-|-|-
jit/jbe|-client/-server|jbe is the same as -Xoptimize in 1.2 based systems, jit is the default. Use -server in 1.3 to replace -Xoptimize (or jbe) in 1.2. 
trace|-XX:+PrintCompilation|traces methods as compiled 
V8/V9|-XX:+UseV8InstrsOnly|Done autmatically on both systems, force architecture using these flags (Sparc/debug only)

Java HotSpot VM �� "_JVM_ARGS" ����������ͬ��ѡ��
----------
_JVM_ARGS |	HotSpot ѡ��|����
-|-|-
bound_threads|-XX:+UseBoundThreads|This option forces all threads to be created as bound threads. 
fixed_size_young_gen|-XX:NewSize=<size> -XX:MaxNewSize=<size> for 1.3 -Xmn<size> for 1.4|Disable young generation resizing.To do this on HotSpot, simply set the size of the young generation to a constant. 
gc_stats|-verbose:gc|Turns on various forms of gc statistics gathering. 
ims_concurrent|none|  
inline_instrs|-XX:MaxInlineSize=<size>|Integer specifying maximum number of bytecode instructions in a method which gets inlined. 
 ^ |-XX:FreqInlineSize=<size>|Integer specifying maximum number of bytecode instructions in a frequently executed method which gets inlined. 
inline_print|-XX:+PrintInlining|Print message about inlined methods (debug only) 
no_parallel_gc|none|
sync_final|none|
yield_interval|-XX:DontYieldALotInterval=<ms>|(debug only) Interval in milliseconds between yields. 
monitor_order|none

����
====
�����о�һЩ����ֱ�ӿ���������

Tenured Generation
: �����

�ο�
====

* ���ô���,Զ��JMX�� http://docs.oracle.com/javase/8/docs/technotes/guides/management/agent.html
* GC��ϵͼ https://blogs.oracle.com/jonthecollector/entry/our_collectors
* Metaspace http://javaeesupportpatterns.blogspot.com/2013/02/java-8-from-permgen-to-metaspace.html
* jvm���� http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html
* http://docs.oracle.com/javase/8/docs/technotes/guides/jpda/conninv.html
* http://docs.oracle.com/javase/8/docs/technotes/guides/jvmti/
* http://www.oracle.com/technetwork/java/javase/documentation/index.html
* Java HotSpot Equivalents of Exact VM Flags http://www.oracle.com/technetwork/java/javase/tech/exactoptions-jsp-141536.html
* http://docs.oracle.com/javase/8/docs/technotes/tools/windows/java.html
