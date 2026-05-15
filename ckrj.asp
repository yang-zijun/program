<!--#include file="dbconn.asp"-->
<%
   const MaxPerPage=6
   dim totalPut
   dim CurrentPage
   dim TotalPages
   dim i,j
   dim keyword
   keyword=trim(request("keyword"))
   dim typename
   typename=request.Querystring("showname")
   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="gb2312">
<title>软件发布系统 - 软件列表</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<style>
    * {
        margin:0; padding:0;
        box-sizing:border-box;
        font-family:"Microsoft YaHei", sans-serif;
    }
    body {
        background: #f5f7fa;
        padding: 40px 20px;
    }
    .container {
        max-width: 950px;
        margin: 0 auto;
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 5px 25px rgba(0,0,0,0.07);
        overflow: hidden;
    }
    .title {
        background: linear-gradient(90deg, #990000, #b31b1b);
        color: #fff;
        padding: 18px 25px;
        font-size: 19px;
        font-weight: bold;
        text-align: center;
    }
    .body {
        padding: 30px 35px;
    }
    .empty {
        text-align: center;
        padding: 70px 20px;
        color: #666;
        font-size: 15px;
    }
    .item {
        border-bottom: 1px solid #f0f0f0;
        padding: 18px 0;
    }
    .item h3 {
        font-size: 16px;
        color: #333;
        margin-bottom: 10px;
        font-weight: 500;
    }
    .item a {
        color: #990000;
        font-weight: bold;
        text-decoration: none;
    }
    .item a:hover {
        color: #c01c1c;
    }
    .info {
        font-size: 14px;
        color: #555;
        line-height: 1.7;
        margin: 5px 0;
    }
    .info span {
        color: #666;
        display: inline-block;
        min-width: 70px;
    }
    .intro {
        color: #666;
        font-size: 14px;
        line-height: 1.6;
        margin-top: 6px;
    }
    .line {
        height: 1px;
        background: #eee;
        margin: 10px 0;
    }
    .page {
        text-align: center;
        padding: 25px 0;
        font-size: 14px;
    }
    .page a {
        color: #990000;
        text-decoration: none;
        padding: 0 5px;
    }
    .page b {
        color: #c00;
        padding: 0 5px;
    }
    .foot {
        text-align: center;
        padding: 20px;
        background: #fbfbfb;
        font-size: 14px;
    }
    .foot a {
        margin: 0 12px;
        color: #990000;
        text-decoration: none;
        font-weight: 500;
    }
    .foot a:hover {
        color: #c01c1c;
    }
</style>
</head>

<body>

<div class="container">
    <div class="title">软件发布系统 - 软件列表</div>
    <div class="body">

<%
dim sql
dim rs
sql="select * from con where title like '%"&keyword&"%' order by id desc"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1

if rs.eof and rs.bof then
%>
<div class="empty">..:: 没 有 数 据 录 入 ::..</div>
<%
else
    totalPut=rs.recordcount
    if currentpage<1 then currentpage=1
    if (currentpage-1)*MaxPerPage>totalput then
        if (totalPut mod MaxPerPage)=0 then
            currentpage= totalPut \ MaxPerPage
        else
            currentpage= totalPut \ MaxPerPage + 1
        end if
    end if

    if currentPage=1 then
        showpages
        showContent
        showpages
    else
        if (currentPage-1)*MaxPerPage<totalPut then
            rs.move  (currentPage-1)*MaxPerPage
            showpages
            showContent
            showpages
        else
            currentPage=1
            showpages
            showContent
            showpages
        end if
    end if
    rs.close
end if

set rs=nothing
conn.close
set conn=nothing
%>

    </div>

    <div class="foot">
        <a href="ckrj.asp">查看网友软件</a>
        <a href="login.asp">管理网友软件</a>
        <a href="add.asp">发布软件</a>
    </div>
</div>

<%
sub showContent
    dim i
    i=0
    do while not rs.eof
%>

<div class="item">
    <h3>
        软件下载：
        <a href="openfile.asp?id=<%=rs("id")%>&amp;url=<%=rs("url")%>" target="_blank">
            <%=rs("showname")%>
        </a>
        <span style="color:#999;font-size:13px;">[<%=rs("dateandtime")%>]</span>
    </h3>

    <div class="info">
        <div><span>发布人：</span> <%=rs("name")%></div>
        <div><span>类型：</span> <%=rs("lx")%></div>
        <div><span>环境：</span> <%=rs("yxhj")%></div>
        <div><span>演示地址：</span> <a href="<%=rs("ys")%>" target="_blank"><%=rs("ys")%></a></div>
    </div>

    <div class="intro">
        <b>简介：</b> <%=rs("title")%>
    </div>
</div>

<%
    i=i+1
    if i>=MaxPerPage then exit do
    rs.movenext
    loop
end sub
%>

<%
sub showpages()
    dim n
    if (totalPut mod MaxPerPage)=0 then
        n= totalPut \ MaxPerPage
    else
        n= totalPut \ MaxPerPage + 1
    end if

    response.write "<div class='page'>"
    response.write "共 <b>"&totalput&"</b> 个软件 "
    response.write " 页码："

    dim k
    for k=1 to n
        if k=currentPage then
            response.write "[<b>"&Cstr(k)&"</b>] "
        else
            response.write "[<a href='ckrj.asp?page="&cstr(k)&"'>"&Cstr(k)&"</a>] "
        end if
    next
    response.write "</div>"
end sub
%>

</body>
</html>