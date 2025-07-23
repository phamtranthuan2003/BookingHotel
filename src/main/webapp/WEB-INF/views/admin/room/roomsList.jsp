<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>

<div class="main-content">
    <h4><i class="bi bi-calendar-check"></i> Quản lý phòng</h4>

    <!-- Nút thêm mới -->
    <div class="text-end mb-3">
        <a href="/admin/addRoom" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm phòng
        </a>
    </div>

    <!-- Thông báo -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle bg-white shadow-sm text-center">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Số phòng</th>
                    <th>Loại phòng</th>
                    <th>Khách sạn</th>
                    <th>Giá (VNĐ)</th>
                    <th>Sức chứa</th>
                    <th>Hình ảnh</th>
                    <th>Trạng thái</th>
                    <th style="width: 140px;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="room" items="${rooms}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${room.roomNumber}</td>
                        <td>${room.type}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty room.hotel}">
                                    ${room.hotel.name}
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted">Chưa gán</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatNumber value="${room.price}" type="number" groupingUsed="true" /> VND
                        </td>

                        <td>${room.capacity} người</td>
                        <td>${room.images}</td>
                        <td>
                            <c:choose>
                                <c:when test="${room.status == 'Còn trống'}">
                                    <span class="badge bg-success">${room.status}</span>
                                </c:when>
                                <c:when test="${room.status == 'Đã đặt'}">
                                    <span class="badge bg-warning text-dark">${room.status}</span>
                                </c:when>
                                <c:when test="${room.status == 'Bảo trì'}">
                                    <span class="badge bg-danger">${room.status}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">${room.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/admin/editRoom/${room.id}" class="btn btn-sm btn-primary">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="/admin/deleteRoom/${room.id}" class="btn btn-sm btn-danger"
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
