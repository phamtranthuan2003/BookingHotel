<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nhập mã OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 450px;">
    <h3 class="text-center mb-4">🔐 Nhập mã OTP</h3>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/user/verifyOtp" method="post">
        <input type="hidden" name="email" value="${email}">
        <div class="mb-3">
            <label for="otp" class="form-label">Mã OTP đã gửi qua email:</label>
            <input type="text" class="form-control" id="otp" name="otp" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Xác nhận</button>
    </form>
    <p class="mt-3 text-center">
        <a href="${pageContext.request.contextPath}/user/forgotPassword">← Quay lại</a>
    </p>
</div>
</body>
</html>