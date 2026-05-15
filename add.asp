<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gb2312">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>东北石油大学 - 软件发布系统</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }

        body {
            background: linear-gradient(135deg, #e8f1ff 0%, #d4e7ff 100%);
            min-height: 100vh;
            padding: 30px 0;
        }

        .container {
            max-width: 750px;
            margin: 0 auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 60, 150, 0.1);
            overflow: hidden;
        }

        .title-bar {
            background: linear-gradient(90deg, #990000, #b31b1b);
            color: #fff;
            text-align: center;
            padding: 20px;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .form-box {
            padding: 40px 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 14px 8px;
            vertical-align: middle;
        }

        .label {
            text-align: right;
            font-weight: 500;
            color: #333;
            width: 120px;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #990000;
            outline: none;
            box-shadow: 0 0 0 3px rgba(153, 0, 0, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 110px;
        }

        .btn-box {
            text-align: center;
            padding-top: 20px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 12px 35px;
            margin: 0 8px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"] {
            background: #990000;
            color: #fff;
        }

        input[type="submit"]:hover {
            background: #b81c1c;
        }

        input[type="reset"] {
            background: #f1f1f1;
            color: #333;
        }

        input[type="reset"]:hover {
            background: #e0e0e0;
        }

        .tip {
            font-size: 12px;
            color: #666;
            margin-left: 6px;
        }

        .red {
            color: #cc0000;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="title-bar">
            东北石油大学（秦皇岛校区）｜软件发布系统
        </div>

        <div class="form-box">
            <form method="POST" action="savefile.asp" onsubmit="return isok(this)">
                <table>
                    <tr>
                        <td class="label">您的姓名：</td>
                        <td>
                            <input type="text" name="txtname" maxlength="5">
                            <span class="tip">最多5个字</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">软件名称：</td>
                        <td><input type="text" name="txtshowname"></td>
                    </tr>
                    <tr>
                        <td class="label">下载地址：</td>
                        <td><input type="text" name="txturl"></td>
                    </tr>
                    <tr>
                        <td class="label">运行环境：</td>
                        <td>
                            <select name="yxhj">
                                <option value="Win9x/WinNT/Win2000/WinXP/WinME" selected>Win9x/WinNT/Win2000/WinXP/WinME</option>
                                <option value="Win9x/WinNT/Win2000/WinME">Win9x/WinNT/Win2000/WinME</option>
                                <option value="Win9x/WinNT/Win2000">Win9x/WinNT/Win2000</option>
                                <option value="ASP环境">ASP环境</option>
                                <option value="PHP环境">PHP环境</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">软件类型：</td>
                        <td>
                            <select name="lx">
                                <option value="源码下载" selected>源码下载</option>
                                <option value="网络软件">网络软件</option>
                                <option value="系统工具">系统工具</option>
                                <option value="图形图象">图形图象</option>
                                <option value="应用软件">应用软件</option>
                                <option value="编程开发">编程开发</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">程序演示：</td>
                        <td>
                            <input type="text" name="ys">
                            <span class="red">（没有可不填）</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="label" valign="top">软件简介：</td>
                        <td>
                            <textarea name="txttitle"></textarea>
                            <div class="tip">请保持在800字以内</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="btn-box">
                            <input type="submit" value="发布软件">
                            <input type="reset" value="清空重填">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <script>
        function isok(theform) {
            if (theform.txtname.value.length < 1 || theform.txtname.value.length > 5) {
                alert("您的姓名最少要1个字，最多5个字！");
                theform.txtname.focus();
                return false;
            }
            if (theform.txtshowname.value == "") {
                alert("软件名称您没有填写！");
                theform.txtshowname.focus();
                return false;
            }
            if (theform.txturl.value == "") {
                alert("下载地址您没有填写！");
                theform.txturl.focus();
                return false;
            }
            if (theform.txttitle.value == "" || theform.txttitle.value.length > 1000) {
                alert("简介不能为空 及 请少于1000汉字！");
                theform.txttitle.focus();
                return false;
            }
            if (theform.lx.value == "") {
                alert("类型不能为空！");
                theform.lx.focus();
                return false;
            }
            return true;
        }
    </script>

</body>
</html>