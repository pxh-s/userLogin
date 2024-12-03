<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }

        /* 查询表单居中样式 */
        .search-form-container {
            display: flex;
            justify-content: center; /* 水平居中表单 */
            margin-bottom: 20px;
        }
        .search-form {
            display: flex; /* 使表单内容按flex布局排列 */
            align-items: center; /* 垂直居中 */
        }

        /* 查询输入框和按钮容器样式 */
        .search-inputs-and-button {
            display: flex;
            align-items: center;
            gap: 10px; /* 设置元素之间的间距 */
        }
        .search-form label {
            display: block;
            margin-bottom: 5px;
        }
        /* 查询输入框容器样式 */
        .search-inputs {
            display: flex; /* 使用flexbox布局 */
            align-items: center; /* 使输入框和标签垂直居中 */
            gap: 10px; /* 设置输入框与标签、输入框之间的间距 */
        }
        /* 联系方式标签样式 */
        .contact-label {
            margin-left: 20px; /* 为联系方式标签增加左边距，以确保与用户名输入框不重叠 */
        }
        .search-form input {
            margin-bottom: 10px;
            padding: 5px;
            width: 200px; /* 可根据需要调整宽度 */
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .search-form button {
            padding: 6px 12px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            margin-top: -10px; /* 根据需要增加按钮与输入框之间的垂直间距 */
        }
        .search-form button:hover {
            background-color: #45a049;
        }

        /* 分页样式调整 */
        .pagination {
            margin-top: 20px;
            margin-right: 10%;
            text-align: right;
        }
        .pagination span, .pagination label, .pagination select {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<h1>成绩列表</h1>

<!-- 查询表单居中容器 -->
<div class="search-form-container">
    <!-- 查询表单 -->
    <form class="search-form" method="get" action="<c:url value='/user/search' />">
        <div class="search-inputs-and-button">
            <label for="usernameParam">用户名:</label>
            <input type="text" id="usernameParam" name="usernameParam" value="${usernameParam}" placeholder="请输入用户名"/>

            <label for="contactParam" class="contact-label">联系方式:</label>
            <input type="text" id="contactParam" name="contactParam" value="${contactParam}" placeholder="请输入联系方式"/>

            <button type="submit">查询</button>
        </div>

</div>

<!-- 用户列表表格 -->
<table>
    <thead>
    <tr>
        <th>用户名</th>
        <th>密码</th>
        <th>联系方式</th>
        <th>地址</th>
        <th>成绩</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList.records}">
        <tr>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>${user.contact}</td>
            <td>${user.address}</td>
            <td>${user.score}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 分页和每页数量选择 -->
<div class="pagination">
    <span>全部数据: ${userList.total} 条</span>
</div>
</body>
</html>
