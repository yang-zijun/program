<!--#include file="dbconn.asp"-->
<%
   const MaxPerPage=6
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j
   dim ip
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
<title>东北石油大学 - 软件管理系统</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<style>
    * {
        margin:0; padding:0;
        box-sizing:border-box;
        font-family:"Microsoft YaHei", sans-serif;
    }
    body {
        background:#f5f7fa;
        padding:40px 20px;
    }
    .container {
        max-width:900px;
        margin:0 auto;
        background:#fff;
        border-radius:12px;
        box-shadow:0 5px 20px rgba(0,0,0,0.08);
        overflow:hidden;
    }
    .title-bar {
        background: linear-gradient(90deg, #990000, #b31b1b);
        color:#fff;
        padding:18px 25px;
        font-size:18px;
        font-weight:bold;
        text-align:center;
    }
    .body-box {
        padding:30px;
    }
    .empty {
        text-align:center;
        padding:60px 20px;
        color:#666;
        font-size:15px;
    }
    .item {
        border-bottom:1px solid #f0f0f0;
        padding:16px 0;
    }
    .item-top {
        display:flex;
        justify-content:space-between;
        color:#666;
        font-size:14px;
        margin-bottom:8px;
    }
    .item-name {
        color:#0066cc;
        font-weight:bold;
    }
    .item-title {
        font-size:16px;
        margin:6px 0;
    }
    .item-title a {
        color:#333;
        text-decoration:none;
        font-weight:500;
    }
    .item-title a:hover {
        color:#990000;
    }
    .item-bar {
        display:flex;
        gap:15px;
        font-size:13px;
        color:#888;
        margin-top:8px;
    }
    .del-btn {
        color:#cc0000;
        text-decoration:none;
        font-weight:bold;
    }
    .page-box {
        text-align:center;
        padding:25px 0 10px;
        color:#333;
    }
    .page-box a {
        color:#990000;
        text-decoration:none;
        padding:0 4px;
    }
    .page-box b {
        color:#cc0000;
        padding:0 4px;
    }
    .line {
        height:1px;
        background:#eee;
        margin:10px 0;
    }
</style>
</head>

<body>

<div class="container">
    <div class="title-bar">软件管理系统</div>
    <div class="body-box">

<%
dim sql, rs
sql="select * from con where title like '%"&keyword&"%' order by id desc"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,0,1

if rs.eof and rs.bof then
%>
<div class="empty">..:: 没 有 数 据 录入 ::..</div>
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
            rs.move (currentPage-1)*MaxPerPage
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
%>

<%
sub showContent
    i=0
    do while not rs.eof
%>

<div class="item">
    <div class="item-top">
        <span>发布人：<span class="item-name"><%=rs("name")%></span></span>
        <span>IP：<%=rs("ip")%></span>
    </div>
    <div class="item-title">
        软件名称：
        <a href="../fbrj/openfile.asp?id=<%=rs("id")%>&amp;url=<%=rs("url")%>" target="_blank">
            <%=rs("showname")%>
        </a>
        <span style="color:#999;font-size:13px;">[<%=rs("dateandtime")%>]</span>
    </div>
    <div class="item-bar">
        <a href="del.asp?id=<%=rs("id")%>&amp;page=<%=currentpage%>" class="del-btn">【删除】</a>
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

    response.write "<div class='page-box'>"
    response.write "共 <b>"&totalput&"</b> 个软件 "
    response.write " 页码："

    dim k
    for k=1 to n
        if k=currentPage then
            response.write "[<b>"&Cstr(k)&"</b>] "
        else
            response.write "[<a href='delnote.asp?page="&cstr(k)&"'>"&Cstr(k)&"</a>] "
        end if
    next
    response.write "</div>"
end sub
%>

    </div>
</div>

</body>
</html>
<%
set rs=nothing
set conn=nothing
%>