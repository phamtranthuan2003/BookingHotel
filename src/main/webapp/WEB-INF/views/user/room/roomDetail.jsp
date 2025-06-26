<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<div class="container my-5">
    <!-- Slider ảnh phòng -->
    <div id="roomCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
        <div class="carousel-inner">
            <img src="${room.imageUrl}" class="d-block w-100" style="height: 400px; object-fit: cover;">
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#roomCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#roomCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- Thông tin phòng -->
    <h2>
        ${room.roomNumber} <span class="text-success ms-3">${room.hotel.name}</span>
    </h2>
    <p>${room.description}</p>

    <div class="row my-4">
        <div class="col-md-6">
            <ul class="list-group">
                <li class="list-group-item">
                    Giá: <strong class="text-danger">
                        <fmt:formatNumber value="${room.price}" type="number" groupingUsed="true" /> VNĐ/đêm
                    </strong>
                </li>
                <li class="list-group-item">Sức chứa: ${room.capacity} người</li>
                <li class="list-group-item">Loại phòng: ${room.type}</li>
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

    <!-- Mạng xã hội -->
    <div class="my-4">
        <h5>Chia sẻ phòng này:</h5>
        <a href="https://www.facebook.com/thuan.phamtran.9/" class="btn btn-outline-primary btn-sm"><i class="bi bi-facebook"></i> Facebook</a>
        <a href="https://www.instagram.com/phamtran.thuan/" class="btn btn-outline-info btn-sm"><i class="bi bi-instagram"></i> Instagram </a>

        <a href="mailto:phamtranthuan2003@gmail.com" class="btn btn-outline-danger btn-sm"><i class="bi bi-envelope"></i> Email</a>
    </div>

    <!-- Chính sách -->
    <div class="my-4">
        <h4>Chính sách hủy phòng</h4>
        <p>Chính sách hủy phòng sẽ được cập nhật sớm.</p>
    </div>

    <!-- Đánh giá -->
    <div class="my-4">
        <h4>Đánh giá của khách hàng</h4>
        <c:choose>
            <c:when test="${not empty reviews}">
                <c:forEach var="review" items="${reviews}">
                    <div class="border rounded p-3 mb-2">
                        <strong>${review.customer.name}</strong> - 
                        <small>${review.room.roomNumber}</small>
                        <div class="text-warning">${review.rating} ⭐</div>
                        <p>${review.comment}</p>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>Chưa có đánh giá nào cho phòng này.</p>
            </c:otherwise>
        </c:choose>
    </div>
    <!-- Gợi ý phòng tương tự -->
    <div class="my-5">
        <h4>Phòng tương tự</h4>
        <p>Chức năng đang phát triển...</p>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />
