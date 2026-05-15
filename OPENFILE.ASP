<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="dbconn.asp"-->
<%
Response.CodePage = 936
Response.Charset = "gb2312"
Session.CodePage = 936

Dim id, url, sql
id = Trim(Request("ID"))
url = Trim(Request("url"))

If id = "" Or url = "" Then
    Response.Write "参数错误"
    Response.End
End If

sql = "UPDATE link SET hits=hits+40 WHERE ID=" & id
conn.Execute(sql)

Set conn = Nothing

Response.Redirect url
%>