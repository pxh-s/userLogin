<%@ page import="org.springframework.util.StringUtils" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            width: 100%;
            /*text-align: center; !* 使容器内的内容默认居中对齐 *!*/
        }
        /*.login-container form {*/
        /*    display: flex;*/
        /*    flex-direction: column;*/
        /*    align-items: center; !* 使表单项在水平方向上居中对齐 *!*/
        /*}*/

        .login-container .register-link {
            display: block;
            width: 100%;
            text-align: right; /* 使超链接水平居右 */
            margin-top: 10px; /* 调整行距，使其与上方的输入框保持一定距离 */
            padding-bottom: 1%;
        }
        .login-container .register-link a {
            color: #007BFF;
            text-decoration: none;
        }

        .login-container .register-link a:hover {
            text-decoration: underline;
        }

        .login-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-container input {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #0056b3;
        }
        .login-container p {
            margin-top: 10px;
            text-align: center;
            color: #d9534f;
        }
        .login-container a{
            padding-bottom: 5%;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>学生成绩管理系统</h2>
    <form action="/user/search" method="post">
        <div>
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="register-link">
            <a href="register.jsp">注册</a>
        </div>
        <div>
            <button type="submit">Login</button>
        </div>
    </form>
    <%
        // 简单的登录逻辑处理
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null) {
            boolean result = (boolean)Optional.ofNullable(request.getAttribute("loginResult")).orElse(false);
            String errMsg = ""+request.getAttribute("errMsg");

            if (result) {
                response.sendRedirect("/user/search");
            }else if(!StringUtils.isEmpty(errMsg) && !StringUtils.pathEquals(errMsg, "null")){
                out.println("<p>"+errMsg+"</p>");
            }
        }
    %>
</div>
</body>
</html>
