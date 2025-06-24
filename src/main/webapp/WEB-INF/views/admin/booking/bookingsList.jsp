<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/layout/admin/header.jsp" />
<div class="main-content">
    <h4><i class="bi bi-calendar-check"></i> Quản lý đặt phòng</h4>

    <!-- Nút thêm mới -->
    <div class="text-end mb-3">
        <a href="/admin/addBooking" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm đặt phòng
        </a>
    </div>
    <!-- Thông báo thành công (nếu có) -->
    <div class="alert alert-success" role="alert">
        <!-- Thêm nội dung thông báo ở đây nếu cần -->
    </div>
    <!-- Bảng dữ liệu -->
    <div class="table-responsive">
        <table class="table table-bordered align-middle text-center">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Tên khách</th>
                    <th>Khách sạn</th>
                    <th>Phòng</th>
                    <th>Ngày nhận</th>
                    <th>Ngày trả</th>
                    <th>Trạng thái</th>
                    <th>Ghi chú</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${booking.user.name}</td>
                        <td>${booking.room.hotel.name}</td>
                        <td>${booking.room.roomNumber}</td>
                        <td>${booking.checkInFormatted}</td>
                        <td>${booking.checkOutFormatted}</td>
                        <td>
                            <span class="badge bg-warning text-dark">${booking.status}</span>
                        </td>
                        <td>${booking.note}</td>
                        <td>
                            <a href="/admin/editBooking/${booking.id}"
                                class="btn btn-sm btn-primary"><i class="bi bi-pencil-square"></i></a>
                            <a href="/admin/editBooking/${booking.id}" class="btn btn-sm btn-danger"
                                onclick="return confirm('Bạn có chắc chắn muốn xóa?')"><i
                                    class="bi bi-trash"></i></a>
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