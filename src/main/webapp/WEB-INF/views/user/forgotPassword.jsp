<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 450px;">
    <h3 class="text-center mb-4">🔑 Quên mật khẩu</h3>

    <!-- Hiển thị thông báo thành công -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <!-- Hiển thị thông báo lỗi -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="/user/enterOTP" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Nhập email của bạn:</label>
            <input type="email" class="form-control" id="email" name="email" required autofocus
                value="${email != null ? email : ''}">
        </div>

        <button type="submit" class="btn btn-warning w-100">Gửi yêu cầu đặt lại mật khẩu</button>
    </form>

    <p class="mt-3 text-center">
        <a href="${pageContext.request.contextPath}/user/login">← Quay lại trang đăng nhập</a>
    </p>
</div>
</body>
</html>
