<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
<div class="main-content">
    <h4><i class="bi bi-calendar-check"></i> Quản lý khách sạn</h4>

    <!-- Nút thêm mới -->
    <div class="text-end mb-3">
        <a href="/admin/hotel/add" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm khách sạn
        </a>
    </div>

    <!-- Thông báo nếu có -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle bg-white shadow-sm">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Tên khách sạn</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Trạng thái</th>
                    <th style="width: 140px;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hotel" items="${hotels}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${hotel.name}</td>
                        <td>${hotel.address}</td>
                        <td>${hotel.phone}</td>
                        <td>
                            <span class="badge ${hotel.active ? 'bg-success' : 'bg-secondary'}">
                                ${hotel.active ? 'Hoạt động' : 'Đã ẩn'}
                            </span>
                        </td>
                        <td>
                            <a href="/admin/hotels/edit?id=${hotel.id}" class="btn btn-sm btn-primary">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="/admin/hotels/delete?id=${hotel.id}" class="btn btn-sm btn-danger" onclick="return confirm('Xoá khách sạn này?')">
                                <i class="bi bi-trash"></i>
                            </a>
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