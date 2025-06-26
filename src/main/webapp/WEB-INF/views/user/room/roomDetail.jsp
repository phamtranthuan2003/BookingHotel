<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<div class="container my-5">
    <!-- Slider ảnh phòng -->
    <div id="roomCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
        <div class="carousel-inner">
            <img src="assets/images/banner.png" class="d-block w-100" style="height: 400px; object-fit: cover;">
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#roomCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#roomCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- Thông tin phòng -->
    <h2>${room.name}</h2>
    <p>${room.description}</p>

    <div class="row my-4">
        <div class="col-md-6">
            <ul class="list-group">
                <li class="list-group-item">Giá: <strong class="text-danger">${room.price} VNĐ/đêm</strong></li>
                <li class="list-group-item">Sức chứa: ${room.capacity} người</li>
                <li class="list-group-item">Diện tích: ${room.area} m²</li>
                <li class="list-group-item">Loại phòng: ${room.roomType}</li>
            </ul>
        </div>
        <div class="col-md-6">
            <form action="/user/booking" method="get">
                <input type="hidden" name="roomId" value="${room.id}">
                <div class="mb-3">
                    <label>Ngày nhận phòng:</label>
                    <input type="date" name="checkin" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Ngày trả phòng:</label>
                    <input type="date" name="checkout" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-success">Đặt phòng ngay</button>
            </form>
        </div>
    </div>

    <!-- Tiện nghi -->
    <div class="my-4">
        <h4>Tiện nghi trong phòng</h4>
        <ul class="row list-unstyled">
            <c:forEach var="f" items="${room.facilities}">
                <li class="col-md-4 mb-2"><i class="bi bi-check-circle text-success me-2"></i>${f}</li>
            </c:forEach>
        </ul>
    </div>

    <!-- Bảng giá -->
    <div class="my-4">
        <h4>Bảng giá theo ngày</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Ngày</th>
                    <th>Giá</th>
                    <th>Tổng cộng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="priceItem" items="${room.dailyPrices}">
                    <tr>
                        <td>${priceItem.date}</td>
                        <td>${priceItem.price} VNĐ</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Mạng xã hội -->
    <div class="my-4">
        <h5>Chia sẻ phòng này:</h5>
        <a href="#" class="btn btn-outline-primary btn-sm"><i class="bi bi-facebook"></i> Facebook</a>
        <a href="#" class="btn btn-outline-info btn-sm"><i class="bi bi-twitter"></i> Twitter</a>
        <a href="#" class="btn btn-outline-danger btn-sm"><i class="bi bi-envelope"></i> Email</a>
    </div>

    <!-- Chính sách -->
    <div class="my-4">
        <h4>Chính sách hủy phòng</h4>
        <p>${room.cancellationPolicy}</p>
    </div>

    <!-- Bản đồ -->
    <div class="my-4">
        <h4>Vị trí khách sạn</h4>
        <div class="ratio ratio-16x9">
            <iframe src="https://maps.google.com/maps?q=${room.location}&output=embed" style="border:0;" allowfullscreen></iframe>
        </div>
    </div>

    <!-- Đánh giá -->
    <div class="my-4">
        <h4>Đánh giá của khách hàng</h4>
        <c:forEach var="review" items="${room.reviews}">
            <div class="border rounded p-3 mb-2">
                <strong>${review.userName}</strong> - <small>${review.date}</small>
                <div class="text-warning">${review.rating} ⭐</div>
                <p>${review.comment}</p>
            </div>
        </c:forEach>
    </div>

    <!-- Gợi ý phòng tương tự -->
    <div class="my-5">
        <h4>Phòng tương tự</h4>
        <div class="row row-cols-1 row-cols-md-3 g-3">
            <c:forEach var="r" items="${relatedRooms}">
                <div class="col">
                    <div class="card h-100">
                        <img src="${r.image}" class="card-img-top" style="height: 180px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${r.name}</h5>
                            <p class="card-text">${r.price} VNĐ/đêm</p>
                            <a href="/user/room/${r.id}" class="btn btn-outline-success btn-sm">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />
