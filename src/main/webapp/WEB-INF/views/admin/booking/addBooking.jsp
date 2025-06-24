<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Thêm đặt phòng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body class="container mt-4">

    <h2>Thêm đặt phòng</h2>

    <form method="post" action="/admin/addBooking">

        <div class="mb-3">
            <label for="customer">Khách hàng:</label>
            <select name="customerId" class="form-select" required>
                <option value="">-- Chọn khách hàng --</option>
                <c:forEach items="${customers}" var="c">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="room">Phòng:</label>
            <select name="roomId" class="form-select" required>
                <option value="">-- Chọn phòng --</option>
                <c:forEach items="${rooms}" var="r">
                    <option value="${r.id}">${r.roomNumber}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label>Ngày đến:</label>
            <input type="date" name="checkIn" class="form-control" required />
        </div>

        <div class="mb-3">
            <label>Ngày đi:</label>
            <input type="date" name="checkOut" class="form-control" required />
        </div>

        <div class="mb-3">
            <label>Ghi chú:</label>
            <textarea name="note" class="form-control"></textarea>
        </div>

        <div class="mb-3">
            <label>Trạng thái:</label>
            <select name="status" class="form-select" required>
                <option value="">-- Chọn trạng thái --</option>
                <option value="Đã đặt">Đã đặt</option>
                <option value="Đã thanh toán">Đã thanh toán</option>
                <option value="Đã hủy">Đã hủy</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Lưu đặt phòng</button>
        <a href="admin/bookings" class="btn btn-secondary">Quay lại</a>

    </form>
</body>
</html>
