<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>修改 Detail 的页面</title>
</head>
<body>
    <h1>修改 评论</h1>
    <form action="/detail/update" method="post">
        <input name="id" placeholder="id" value="${topicComment.id}">
        <input name="content" placeholder="content" value="${topicComment.content}">
        <br>
        <button type="submit">提交修改</button>
    </form>
</body>
</html>
