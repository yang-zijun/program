<!--#include file="dbconn.asp"-->
<%
username = Trim(Request("username"))
password = Trim(Request("password"))

Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM admin WHERE username='"&username&"' AND password='"&password&"'"
rs.Open sql,conn,1,1

If Not rs.EOF Then
    Response.Cookies("adminok") = "true"
    Response.Redirect "delnote.asp"
Else
    Response.Redirect "login.asp"
End If

rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>