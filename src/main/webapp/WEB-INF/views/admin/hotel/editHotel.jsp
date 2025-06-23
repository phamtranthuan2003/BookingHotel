<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm khách sạn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .form-label {
            font-weight: 600;
        }
        .card {
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card p-4">
                <h3 class="mb-4 text-center text-primary">Sửa khách sạn</h3>

                <!-- HTML thuần -->
                <form method="POST" action="${pageContext.request.contextPath}/admin/editHotel/${hotel.id}">
                    <!-- Tên khách sạn -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên khách sạn</label>
                        <input type="text" name="name" id="name" value="${hotel.name}" class="form-control"/>
                    </div>

                    <!-- Địa chỉ -->
                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ</label>
                        <input type="text" name="address" id="address" value="${hotel.address}" class="form-control"/>
                    </div>

                    <!-- Mô tả -->
                    <div class="mb-3">
                        <label for="description" class="form-label">Mô tả</label>
                        <textarea name="description" id="description" rows="4" class="form-control">${hotel.description}</textarea>
                    </div>

                    <!-- Đánh giá -->
                    <div class="mb-3">
                        <label for="rating" class="form-label">Đánh giá (1 - 5)</label>
                        <input type="number" name="rating" id="rating" min="1" max="5" step="0.1" value="${hotel.rating}" class="form-control"/>
                    </div>

                    <!-- Nút -->
                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" class="btn btn-success">💾 Sửa</button>
                        <a href="/admin/hotels" class="btn btn-outline-secondary">⬅ Quay lại</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
