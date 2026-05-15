<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="conn.asp" -->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gb2312">
    <title>东北石油大学软件管理系统</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", "SimSun", sans-serif;
        }
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        /* 轮播背景 */
        .bg-slideshow {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        .bg-slideshow img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: opacity 1.5s ease-in-out;
        }
        .bg-slideshow img.active {
            opacity: 1;
        }

        /* 顶部标题栏 */
        .header {
            position: absolute;
            top: 30px;
            left: 60px;
            display: flex;
            align-items: center;
            gap: 15px;
            z-index: 10;
        }
        .logo {
            width: 80px;
            height: 80px;
            background-image: url("school_logo.png");
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }
        .title-group {
            color: #fff;
        }
        .school-title {
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 2px;
        }
        .system-title {
            font-size: 22px;
            margin-left: 10px;
        }
        .school-en {
            font-size: 15px;
            margin-top: 5px;
        }
        /* 右侧登录框 */
        .login-container {
            position: absolute;
            right: 180px;
            top: 45%;
            transform: translateY(-50%);
            background: rgba(255,255,255,0.95);
            border-radius: 4px;
            width: 370px;
            padding: 25px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            z-index: 10;
        }
        /* 选项卡 */
        .tab {
            display: flex;
            margin-bottom: 25px;
        }
        .tab-item {
            width: 50%;
            text-align: center;
            font-size: 16px;
            padding: 10px 0;
            cursor: pointer;
            color: #666;
            border-bottom: 2px solid transparent;
        }
        .tab-item.active {
            color: #990000;
            border-bottom-color: #990000;
            font-weight: bold;
        }
        /* 输入框 */
        .input-group {
            margin-bottom: 18px;
        }
        .input-group input {
            width: 100%;
            height: 42px;
            padding: 0 15px;
            border: 1px solid #ddd;
            border-radius: 2px;
            font-size: 14px;
            color: #333;
        }
        .input-group input::placeholder {
            color: #aaa;
        }
        /* 验证码 */
        .captcha-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .captcha-input {
            flex: 1;
        }
        .captcha-code {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            padding: 0 10px;
            background: #f0f0f0;
            border-radius: 2px;
            user-select: none;
        }
        /* 登录按钮 */
        .btn-login {
            width: 100%;
            height: 45px;
            background-color: #990000;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 2px;
            margin-top: 10px;
        }
        /* 底部链接 */
        .link-group {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 12px;
            color: #666;
        }
        .link-group a {
            color: #666;
            text-decoration: none;
        }
        .link-group a:hover {
            color: #990000;
        }
        /* 底部版权 */
        .footer {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(255,255,255,0.9);
            text-align: center;
            padding: 10px 0;
            font-size: 12px;
            color: #666;
            z-index: 10;
        }
    </style>
</head>
<body>

    <!-- 轮播背景 -->
    <div class="bg-slideshow">
        <img src="bg1.jpg" class="active">
        <img src="bg2.jpg">
        <img src="bg3.jpg">
    </div>

    <!-- 顶部标题 -->
    <div class="header">
        <div class="logo"></div>
        <div class="title-group">
            <span class="school-title">东北石油大学（秦皇岛校区）</span>
            <span class="system-title">| 软件管理系统</span>
            <div class="school-en">NORTHEAST PETROLEUM UNIVERSITY（QINHUANGDAO）</div>
        </div>
    </div>

    <!-- 右侧登录框 -->
    <div class="login-container">
        <div class="tab">
            <div class="tab-item active" onclick="switchTab(0)">账户登录</div>
            <div class="tab-item" onclick="switchTab(1)">账户注册</div>
        </div>

        <!-- 登录表单 -->
        <form id="loginForm" method="post" action="chklogin.asp" onsubmit="return checkform()">
            <div class="input-group">
                <input type="text" name="username" placeholder="账号为教工号或者学号">
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="初次密码为nepu+身份证后六位">
            </div>
            <div class="input-group captcha-group">
                <input type="text" name="captcha" class="captcha-input" placeholder="请输入验证码">
                <div class="captcha-code">1 * 9 = ?</div>
            </div>

            <button type="submit" class="btn-login">登录</button>

            <div class="link-group">
                <label><input type="checkbox"> 记住密码</label>
                <div>
                    <a href="#">常见问题</a>
                    <a href="#">忘记密码</a>
                </div>
            </div>
        </form>

        <!-- 注册表单（替换原来的二维码） -->
        <form id="regForm" method="post" action="" style="display:none;">
            <div class="input-group">
                <input type="text" name="reg_user" placeholder="请输入账号（学号/工号）" required>
            </div>
            <div class="input-group">
                <input type="password" name="reg_pwd" placeholder="请输入密码" required>
            </div>
            <div class="input-group">
                <input type="password" name="reg_pwd2" placeholder="请确认密码" required>
            </div>

            <button type="submit" name="regBtn" class="btn-login">立即注册</button>
        </form>
    </div>

    <!-- 底部版权 -->
    <div class="footer">
        2026 东北石油大学 版权所有 | 技术支持：现代教育技术中心 17603634049（李老师）建议使用浏览器：Chrome、Firefox、Edge80.0及以上、Safari
    </div>

    <script>
        // 轮播
        let index = 0;
        const imgs = document.querySelectorAll('.bg-slideshow img');
        setInterval(() => {
            imgs[index].classList.remove('active');
            index = (index + 1) % imgs.length;
            imgs[index].classList.add('active');
        }, 8000);

        // 切换登录/注册
        function switchTab(n){
            let items = document.querySelectorAll('.tab-item');
            items[0].classList.remove('active');
            items[1].classList.remove('active');
            items[n].classList.add('active');

            if(n==0){
                document.getElementById('loginForm').style.display='block';
                document.getElementById('regForm').style.display='none';
            }else{
                document.getElementById('loginForm').style.display='none';
                document.getElementById('regForm').style.display='block';
            }
        }

        // 登录验证
        function checkform(){
            var f = document.forms[0];
            if(f.username.value==""){
                alert("请输入账号！");
                f.username.focus();
                return false;
            }
            if(f.password.value==""){
                alert("请输入密码！");
                f.password.focus();
                return false;
            }
            return true;
        }
    </script>
</body>
</html>

<%
' 注册提交逻辑（存入 MySQL program 库 con 表）
If Request.Form("regBtn")<>"" Then
    Dim username, password, password2
    username = Trim(Request.Form("reg_user"))
    password = Trim(Request.Form("reg_pwd"))
    password2 = Trim(Request.Form("reg_pwd2"))

    If password<>password2 Then
        Response.Write "<script>alert('两次密码不一致！');history.back();</script>"
        Response.End()
    End If

    ' 检查账号是否已存在
    Set rsCheck = Server.CreateObject("ADODB.Recordset")
    sqlCheck = "select * from con where username='"&username&"'"
    rsCheck.open sqlCheck,conn,1,1
    If Not rsCheck.eof Then
        Response.Write "<script>alert('该账号已注册！');history.back();</script>"
        rsCheck.close()
        Response.End()
    End If
    rsCheck.close()

    ' 插入数据库
    sqlInsert = "insert into con(username,password) values('"&username&"','"&password&"')"
    conn.execute(sqlInsert)

    Response.Write "<script>alert('注册成功！请登录');location.href='login.asp';</script>"
End If
%>