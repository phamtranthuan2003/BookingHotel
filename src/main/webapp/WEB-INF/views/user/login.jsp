<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 450px;">
    <h3 class="text-center mb-4">🔐 Đăng nhập</h3>

    <!-- Hiển thị thông báo lỗi -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="/user/login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required autofocus>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        

        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <div class="mt-3 text-center">
        <a href="/user/forgotPassword">Quên mật khẩu?</a>
        <span class="mx-2">|</span>
        <a href="/user/signup">Đăng ký</a>
    </div>
</div>
</body>
</html>
