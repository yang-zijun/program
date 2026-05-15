<%
Dim conn,connstr
Set conn = Server.CreateObject("ADODB.Connection")

connstr = "DRIVER={MySQL ODBC 9.7 Unicode Driver};" & _
          "SERVER=localhost;" & _
          "DATABASE=program;" & _
          "UID=root;" & _
          "PWD=123456;" & _
          "PORT=3306;" & _
          "CharSet=gbk;"
conn.Open connstr
%>