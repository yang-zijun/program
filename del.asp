<%@ LANGUAGE="VBSCRIPT" %>
<% option explicit %>
<%
if request.cookies("adminok")="" then
  response.redirect "login.asp"
end if
%>
<!--#include file="dbconn.asp"-->
<%
   dim sql 
   dim rs
   set rs=server.createobject("adodb.recordset")
   sql="delete from con where id="&request("id")
   rs.open sql,conn,1,1
   set rs=nothing  
   conn.close
   set conn=nothing

   response.redirect "delnote.asp?page="&request("page")

%>
<html>
<head>
<title></title>
</head>
<body>
</body>
</html>
