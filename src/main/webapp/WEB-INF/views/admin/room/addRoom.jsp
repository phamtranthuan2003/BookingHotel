<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Thêm phòng mới</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .form-label {
            font-weight: 600;
        }

        .card {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card p-4">
                    <h3 class="mb-4 text-center text-primary">Thêm phòng mới</h3>

                    <form action="/admin/addRoom" method="post">
                        <!-- Tên phòng -->
                        <div class="mb-3">
                            <label class="form-label">Số phòng</label>
                            <input type="text" name="roomNumber" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tên phòng</label>
                            <input type="text" name="type" class="form-control" required>
                        </div>

                        <!-- Giá phòng -->
                        <div class="mb-3">
                            <label class="form-label">Giá (VNĐ)</label>
                            <input type="text" name="priceFormatted" id="priceFormatted" class="form-control"
                                required>
                            <input type="hidden" name="price" id="price" />
                        </div>

                        <!-- Sức chứa -->
                        <div class="mb-3">
                            <label class="form-label">Sức chứa</label>
                            <input type="number" name="capacity" class="form-control" min="1" required>
                        </div>

                        <!-- Chọn khách sạn -->
                        <div class="mb-3">
                            <label class="form-label">Khách sạn</label>
                            <select name="hotelId" class="form-select" required>
                                <option value="">-- Chọn khách sạn --</option>
                                <c:forEach var="hotel" items="${hotels}">
                                    <option value="${hotel.id}">${hotel.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <select
                            name="status" class="form-select mb-3" required>
                            <option value="">-- Chọn trạng thái --</option>
                            <option value="AVAILABLE">Còn trống</option>
                            <option value="BOOKED">Đã đặt</option>
                            <option value="MAINTENANCE">Bảo trì</option>
                        </select>
                        <!-- Mô tả -->
                        <div class="mb-3">
                            <label class="form-label">Mô tả</label>
                            <textarea name="description" class="form-control" rows="3"></textarea>
                        </div>

                        <!-- Nút -->
                        <div class="d-flex justify-content-between mt-4">
                            <button type="submit" class="btn btn-success">💾 Thêm</button>
                            <a href="${pageContext.request.contextPath}/admin/rooms"
                                class="btn btn-outline-secondary">⬅ Quay lại</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<script>
    const inputFormatted = document.getElementById('priceFormatted');
    const inputHidden = document.getElementById('price');

    inputFormatted.addEventListener('input', function () {
        let value = this.value.replace(/\D/g, '');
        this.value = new Intl.NumberFormat('vi-VN').format(value);
        inputHidden.value = value;
    });
</script>