
:: ʵ��һ�� CMDRC, ÿ������
reg add "hklm\software\Microsoft\Command Processor" /f /v AutoRun /d "C:\cmdrc.cmd" > NUL
:: ����򵥵�һ����ʾ��
prompt $P$_$$$S

:: ��̨���� �൱��linux�µ� xxx &
START /B xxx.exe

:: SC ������� http://support.microsoft.com/kb/251192
sc create svnserve binpath= "\"C:\Program Files\CollabNet Subversion Server\svnserve.exe\" --service -r \"C:\my repositories\"  " displayname= "Subversion Server" depend= Tcpip start= auto

sc create asperacentral binPath= "C:\Program Files\Aspera\Enterprise Server\bin\Debug\asperacentral.exe" DisplayName= "Aspera Central" start= auto

:: CMD ���з���Ϊ ^ �൱�� linux�� \