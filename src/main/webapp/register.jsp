<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page</title>
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

            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 300px;
                width: 100%;
                /*text-align: center; !* 使容器内的内容默认居中对齐 *!*/
            }

            .login-container form {
                /* ... 如果之前注释掉了，现在取消注释以使表单项居中对齐 ... */
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .form-group {
                width: 100%;
                margin-bottom: 15px;
            }
        </style>
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                if (password !== confirmPassword) {
                    alert("密码和确认密码必须相同！");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
    <div class="login-container">
        <h2>注册</h2>
        <form action="/user/register" method="post" accept-charset="UTF-8" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">用户名称:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">用户密码:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">确认密码:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div class="form-group">
                <label for="contact">联系方式:</label>
                <input type="text" id="contact" name="contact">
            </div>
            <div class="form-group">
                <label for="address">地址:</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="register-link">
                <a href="index.jsp">登录</a>
            </div>
            <button type="submit">注册</button>
        </form>
    </div>
    </body>
</html>
