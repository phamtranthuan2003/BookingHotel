<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 450px;">
    <h4 class="mb-3">Đặt lại mật khẩu</h4>

    <form action="${pageContext.request.contextPath}/user/resetPassword" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email của bạn:</label>
            <input type="email" class="form-control" id="email" name="email" 
                   value="<%= request.getParameter("email") %>" readonly>
        </div>

        <div class="mb-3">
            <label for="newPassword" class="form-label">Mật khẩu mới:</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
        </div>

        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Nhập lại mật khẩu:</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        </div>

        <button type="submit" class="btn btn-primary">Đặt lại mật khẩu</button>
    </form>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger mt-3">${error}</div>
    </c:if>

    <c:if test="${not empty message}">
        <div class="alert alert-success mt-3">${message}</div>
    </c:if>
</div>
</body>
</html>
