<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hello 壽險投保作業工作台</title>
</head>

<body>
    <p>${name}</p>
    <p>hello</p>
    <p><%= request.getAttribute("name")  %></p> <%//-還沒有el的老舊寫法--%>
</body>

</html>