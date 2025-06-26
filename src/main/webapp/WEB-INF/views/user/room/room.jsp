<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<style>
    .room-card {
        background: #ffffff;
        border: 2px solid #154734;
        /* Xanh rêu */
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        overflow: hidden;
        transition: transform 0.3s ease;
    }

    .room-card:hover {
        transform: scale(1.02);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }

    .room-image {
        width: 100%;
        height: 220px;
        object-fit: cover;
    }

    .room-content {
        padding: 20px;
    }

    .room-title {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #111111;
        /* Đen than */
    }

    .room-badge {
        background: #a60000;
        /* Đỏ rượu */
        color: white;
        padding: 5px 10px;
        font-size: 12px;
        border-radius: 50px;
        float: right;
    }

    .room-desc {
        font-size: 14px;
        color: #333;
        min-height: 50px;
    }

    .room-rating {
        color: #d4af37;
        /* Vàng kim */
        margin-bottom: 10px;
        font-size: 16px;
    }

    .room-price {
        font-size: 18px;
        color: #d4af37;
        font-weight: bold;
    }

    .btn-book,
    .btn-detail {
        display: inline-block;
        background: #154734;
        /* Xanh rêu */
        color: white;
        padding: 8px 16px;
        border-radius: 30px;
        text-decoration: none;
        font-size: 14px;
        margin-top: 10px;
        margin-right: 8px;
        transition: 0.3s ease;
    }

    .btn-book:hover,
    .btn-detail:hover {
        background: #0e3224;
    }
</style>

<div class="container mt-5">
    <h2 class="text-center mb-4" style="color:#154734;">🛏️ Phòng nghỉ tại David Suối Hotel</h2>

    <div class="row">
        <c:forEach var="room" items="${rooms}">
            <div class="col-md-4">
                <div class="room-card">
                    <a href="/user/roomDetail/${room.id}">
                        <img src="${room.imageUrl}" class="room-image" />
                    </a>
                    <div class="room-content">
                        <div class="d-flex justify-content-between">
                            <div class="room-title">${room.hotel.name}</div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div class="room-title">${room.roomNumber}</div>
                            <div class="room-badge">New⭐</div>
                        </div>
                        <div class="room-rating">⭐ ⭐ ⭐ ⭐</div>
                        <p class="room-desc">${room.description}</p>
                        <div class="room-price">
                            <fmt:formatNumber value="${room.price}" type="number" groupingUsed="true" /> VND/đêm
                        </div>

                        <div>
                            <a href="/user/roomDetail/${room.id}"
                                class="btn-detail">Xem chi tiết</a>
                            <a href="#" class="btn-book">Đặt phòng</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />