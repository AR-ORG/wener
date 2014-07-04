
#  java ����
http://download.oracle.com/javase/6/docs/technotes/guides/net/proxies.html
# net ������ http://docs.oracle.com/javase/7/docs/api/java/net/doc-files/net-properties.html
# �ο� http://stackoverflow.com/questions/120797
# http://docs.oracle.com/javase/7/docs/technotes/guides/net/proxies.html

JAVA_FLAGS=-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8087
java %JAVA_FLAGS%
# proxySet �ƺ�����Ч��
if (needsProxy()) {
    System.getProperties().put("proxySet", "true");
    System.getProperties().put("proxyHost", getProxyHost());
    System.getProperties().put("proxyPort", getProxyPort());
} else {
    System.getProperties().put("proxySet", "false");
    System.getProperties().put("proxyHost", "");
    System.getProperties().put("proxyPort", "");
}
