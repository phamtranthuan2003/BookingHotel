<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>

<div class="main-content">
    <h4><i class="bi bi-calendar-check"></i> Quản lý khách sạn</h4>

    <!-- Nút thêm mới -->
    <div class="text-end mb-3">
        <a href="/admin/addHotel" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm khách sạn
        </a>
    </div>

    <!-- Thông báo nếu có -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <!-- Danh sách khách sạn -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle bg-white shadow-sm text-center">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Tên khách sạn</th>
                    <th>Địa chỉ</th>
                    <th>Mô tả</th>
                    <th>Đánh giá</th>
                    <th style="width: 140px;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hotel" items="${hotels}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${hotel.name}</td>
                        <td>${hotel.address}</td>
                        <td>${hotel.description}</td>
                        <td>${hotel.rating}</td>
                        <td>
                            <a href="/admin/editHotel/${hotel.id}" class="btn btn-sm btn-primary" title="Chỉnh sửa">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="/admin/hotels/${hotel.id}" class="btn btn-sm btn-danger" title="Xoá"
                               onclick="return confirm('Bạn có chắc chắn muốn xoá khách sạn này?');">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
