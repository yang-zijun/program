<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")

' 匹配你电脑里的 MySQL ODBC 9.7 驱动（二选一即可，推荐用 Unicode 版本）
conn.Open "Driver={MySQL ODBC 9.7 Unicode Driver};Server=localhost;Port=3306;Database=program;UID=root;PWD=123456;OPTION=3;"
%>