<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<%
Response.CodePage=936
Response.Charset="gb2312"
Session.CodePage=936
%>
<!--#include file="dbconn.asp"-->
<!--#include file="inc/char.inc"-->
<%
dim id, title, url, ip, ys, showname, name, lx, yxhj
dim sql, founderr, errmsg

founderr = false
errmsg = ""

if founderr=false then
    id = htmlencode2(request.form("txtid"))
    name = htmlencode2(request.form("txtname"))
    ip = Request.ServerVariables("REMOTE_ADDR")
    ys = htmlencode2(request.form("ys"))
    showname = htmlencode2(request.form("txtshowname"))
    title = htmlencode2(request.form("txttitle"))
    lx = htmlencode2(request.form("lx"))
    yxhj = htmlencode2(request.form("yxhj"))
    url = request.form("txturl")

    sql = "INSERT INTO con (txtid, name, showname, url, yxhj, lx, ys, title, ip, dateandtime) " & _
          "VALUES ('" & Replace(id, "'", "''") & "', '" & _
          Replace(name, "'", "''") & "', '" & _
          Replace(showname, "'", "''") & "', '" & _
          Replace(url, "'", "''") & "', '" & _
          Replace(yxhj, "'", "''") & "', '" & _
          Replace(lx, "'", "''") & "', '" & _
          Replace(ys, "'", "''") & "', '" & _
          Replace(title, "'", "''") & "', '" & ip & "', '" & Date() & "')"

    conn.Execute(sql)
end if
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>发布成功 - 东北石油大学软件发布系统</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<style>
    * {
        margin:0; padding:0;
        box-sizing:border-box;
        font-family:"Microsoft YaHei", sans-serif;
    }
    body {
        background: #f5f7fa;
        padding: 60px 20px;
    }
    .box {
        max-width: 700px;
        margin: 0 auto;
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 8px 30px rgba(0,60,150,0.1);
        overflow: hidden;
    }
    .head {
        background: linear-gradient(90deg, #990000, #b31b1b);
        color: #fff;
        padding: 22px;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
    }
    .body {
        padding: 40px;
    }
    .success {
        text-align: center;
        color: #27a158;
        font-size: 17px;
        margin-bottom: 30px;
        font-weight: bold;
    }
    .info {
        line-height: 2.1;
        font-size: 15px;
        color: #333;
        padding: 0 10px;
    }
    .info span {
        color: #666;
        display: inline-block;
        width: 90px;
    }
    .btns {
        text-align: center;
        margin-top: 35px;
    }
    .btns a {
        display: inline-block;
        padding: 12px 30px;
        background: #990000;
        color: #fff;
        border-radius: 6px;
        text-decoration: none;
        font-size: 15px;
        transition: 0.3s;
    }
    .btns a:hover {
        background: #c01c1c;
    }
    .footer {
        margin-top: 50px;
        text-align: center;
        font-size: 13px;
        color: #888;
        line-height: 1.8;
    }
</style>
</head>

<body>
<div class="box">
    <div class="head">软件发布系统 - 发布成功</div>
    <div class="body">
        <div class="success">? 添加成功，非常感谢您提供优质软件！</div>
        <div class="info">
            <div><span>您的姓名：</span> <%=name%></div>
            <div><span>下载地址：</span> <%=url%></div>
            <div><span>软件名称：</span> <%=showname%></div>
            <div><span>运行环境：</span> <%=yxhj%></div>
            <div><span>软件类型：</span> <%=lx%></div>
            <div><span>程序演示：</span> <%=ys%></div>
            <div><span>发布时间：</span> <%=date()%></div>
            <div><span>您的IP是：</span> <%=ip%></div>
        </div>
        <div class="btns">
            <a href="add.asp">继续发布软件</a>
        </div>
    </div>
</div>
<div class="footer">
    欢迎您在本网站发布软件！<br>
    本网站上的软件都是免费的！<br>
    希望您能多多给予好的建议！<br><br>
    联系邮箱：ipqlsyg20059@126.com<br>
    联系电话：0736-7185312
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>