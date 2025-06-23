<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5" style="max-width: 600px;">
        <h2 class="mb-4 text-center">📝 Chỉnh sửa tài khoản khách hàng</h2>

        <form action="/admin/editCustomer/${customer.id}" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Họ tên</label>
                <input type="text" class="form-control" id="name" name="name" required value="${customer.name}">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Địa chỉ Email</label>
                <input type="email" class="form-control" id="email" name="email" required
                    value="${customer.email}">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password" required
                    value="${customer.password}" minlength="6">
            </div>

            <div class="mb-3">
                <label for="re-password" class="form-label">Nhập lại mật khẩu:</label>
                <input type="password" class="form-control" id="re-password" name="rePassword" required
                    value="${customer.password}">
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Số điện thoại</label>
                <input type="text" class="form-control" id="phone" name="phone" required
                    value="${customer.phone}">
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Địa chỉ</label>
                <input class="form-control" id="address" name="address" rows="2" required
                    value="${customer.address}">
            </div>
            <div class="mb-3">
                <label class="form-label">Vai trò:</label>
                <c:forEach var="role" items="${roles}">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="roleId" id="role_${role.id}"
                            value="${role.id}" ${role.id == customer.role.id ? 'checked' : ''} required>
                        <label class="form-check-label" for="role_${role.id}">
                            ${role.name}
                        </label>
                    </div>
                </c:forEach>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sửa người dùng</button>
        </form>

        <p class="mt-3 text-center">
        </p>
    </div>
</body>

</html>