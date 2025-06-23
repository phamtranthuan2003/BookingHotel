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
                    <h3 class="mb-4 text-center text-primary">Sửa phòng</h3>

                    <form action="/admin/editRoom/${room.id}" method="post">
                        <!-- Tên phòng -->
                        <div class="mb-3">
                            <label class="form-label">Số phòng</label>
                            <input type="text" name="roomNumber" class="form-control" required
                                value="${room.roomNumber}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tên phòng</label>
                            <input type="text" name="type" class="form-control" required value="${room.type}">
                        </div>

                        <!-- Giá phòng -->
                        <!-- Giá phòng -->
                        <div class="mb-3">
                            <label class="form-label">Giá (VNĐ)</label>
                            <input type="text" name="priceFormatted" id="priceFormatted" class="form-control"
                                required
                                value="<fmt:formatNumber value='${room.price}' type='number' groupingUsed='true'/>">
                            <input type="hidden" name="price" id="price" value="${room.price}" />
                        </div>


                        <!-- Sức chứa -->
                        <div class="mb-3">
                            <label class="form-label">Sức chứa</label>
                            <input type="number" name="capacity" class="form-control" min="1" required
                                value="${room.capacity}">
                        </div>

                        <!-- Chọn khách sạn -->
                        <div class="mb-3">
                            <label class="form-label">Khách sạn</label>
                            <select name="hotelId" class="form-select" required>
                                <option value="">-- Chọn khách sạn --</option>
                                <c:forEach var="hotel" items="${hotels}">
                                    <option value="${hotel.id}" <c:if test="${hotel.id == room.hotel.id}">
                                        selected</c:if>>
                                        ${hotel.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>


                        <!-- Mô tả -->
                        <div class="mb-3">
                            <label class="form-label">Mô tả</label>
                            <input name="description" class="form-control" rows="3" value="${room.description}">
                        </div>

                        <!-- Nút -->
                        <div class="d-flex justify-content-between mt-4">
                            <button type="submit" class="btn btn-success">💾 Sửa</button>
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
        let raw = this.value.replace(/\D/g, ''); // chỉ giữ số
        inputHidden.value = raw;
        this.value = new Intl.NumberFormat('vi-VN').format(raw);
    });

    // Định dạng ngay khi trang load
    window.addEventListener('DOMContentLoaded', function () {
        let value = inputHidden.value;
        if (value) {
            inputFormatted.value = new Intl.NumberFormat('vi-VN').format(value);
        }
    });
</script>