<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>

<div class="main-content">
     <h4><i class="bi bi-calendar-check"></i> Quản lý phòng</h4>

    <!-- Nút thêm mới -->
    <div class="text-end mb-3">
        <a href="/admin/room/add" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm phòng
        </a>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle bg-white shadow-sm">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Tên phòng</th>
                    <th>Thuộc khách sạn</th>
                    <th>Loại phòng</th>
                    <th>Giá (VNĐ)</th>
                    <th>Sức chứa</th>
                    <th>Trạng thái</th>
                    <th style="width: 140px;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="room" items="${rooms}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${room.name}</td>
                        <td>${room.hotel.name}</td>
                        <td>${room.type}</td>
                        <td><fmt:formatNumber value="${room.price}" type="currency" currencySymbol="₫"/></td>
                        <td>${room.capacity} người</td>
                        <td>
                            <span class="badge ${room.active ? 'bg-success' : 'bg-secondary'}">
                                ${room.active ? 'Hoạt động' : 'Tạm ẩn'}
                            </span>
                        </td>
                        <td>
                            <a href="/admin/room/edit?id=${room.id}" class="btn btn-sm btn-primary">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="/admin/room/delete?id=${room.id}" class="btn btn-sm btn-danger"
                               onclick="return confirm('Xoá phòng này?')">
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
