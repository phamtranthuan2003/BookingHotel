<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/WEB-INF/views/layout/admin/header.jsp" />
<div class="main-content">
    <h4><i class="bi bi-people"></i> Quản lý người dùng</h4>
    <!-- Nút thêm người dùng -->
    <div class="text-end mb-3">
        <a href="/admin/addCustomer" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm người dùng
        </a>
    </div>
    <!-- Thông báo thành công nếu có -->
    <div class="alert alert-success" role="alert">
        <!-- Nội dung thông báo nếu cần -->
    </div>

    <!-- Bảng danh sách người dùng -->
    <div class="table-responsive">
        <table class="table table-bordered align-middle text-center">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Tên người dùng</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Vai trò</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.name}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.address}</td>
                        <td>${customer.role.name}</td>
                        <td><span class="badge bg-success">Hoạt động</span></td>
                        <td>
                            <a href="/admin/editCustomer/${customer.id}" class="btn btn-sm btn-primary"><i class="bi bi-pencil-square"></i></a>
                            <a href="/admin/deleteCustomer/${customer.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')"><i class="bi bi-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>
