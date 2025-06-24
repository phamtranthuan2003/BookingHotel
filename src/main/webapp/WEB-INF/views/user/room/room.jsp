<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<style>
    .room-card {
        background: #ffffff;
        border: 2px solid #154734; /* Xanh rêu */
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
        color: #111111; /* Đen than */
    }

    .room-badge {
        background: #a60000; /* Đỏ rượu */
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
        color: #d4af37; /* Vàng kim */
        margin-bottom: 10px;
        font-size: 16px;
    }

    .room-price {
        font-size: 18px;
        color: #d4af37;
        font-weight: bold;
    }

    .btn-book, .btn-detail {
        display: inline-block;
        background: #154734; /* Xanh rêu */
        color: white;
        padding: 8px 16px;
        border-radius: 30px;
        text-decoration: none;
        font-size: 14px;
        margin-top: 10px;
        margin-right: 8px;
        transition: 0.3s ease;
    }

    .btn-book:hover, .btn-detail:hover {
        background: #0e3224;
    }
</style>

<div class="container mt-5">
    <h2 class="text-center mb-4" style="color:#154734;">🛏️ Phòng nghỉ tại David Suối Hotel</h2>

    <div class="row">
        <!-- Phòng 1 -->
        <div class="col-md-4">
            <div class="room-card">
                <img src="https://cdn.pixabay.com/photo/2016/11/29/10/07/bedroom-1866708_960_720.jpg" class="room-image" />
                <div class="room-content">
                    <div class="d-flex justify-content-between">
                        <div class="room-title">Phòng Deluxe</div>
                        <div class="room-badge">🔥 Hot</div>
                    </div>
                    <div class="room-rating">⭐ ⭐ ⭐ ⭐ ⭐</div>
                    <p class="room-desc">Phòng rộng rãi, có ban công hướng biển, nội thất cao cấp.</p>
                    <div class="room-price">2.000.000 VND/đêm</div>
                    <div>
                        <a href="#" class="btn-detail">Xem chi tiết</a>
                        <a href="#" class="btn-book">Đặt phòng</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Phòng 2 -->
        <div class="col-md-4">
            <div class="room-card">
                <img src="https://cdn.pixabay.com/photo/2017/07/08/01/20/hotel-2484433_960_720.jpg" class="room-image" />
                <div class="room-content">
                    <div class="d-flex justify-content-between">
                        <div class="room-title">Phòng Standard</div>
                        <div class="room-badge">🆕 New</div>
                    </div>
                    <div class="room-rating">⭐ ⭐ ⭐ ⭐</div>
                    <p class="room-desc">Phòng tiêu chuẩn, đầy đủ tiện nghi, giá hợp lý.</p>
                    <div class="room-price">1.200.000 VND/đêm</div>
                    <div>
                        <a href="#" class="btn-detail">Xem chi tiết</a>
                        <a href="#" class="btn-book">Đặt phòng</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Phòng 3 -->
        <div class="col-md-4">
            <div class="room-card">
                <img src="https://cdn.pixabay.com/photo/2016/03/27/21/16/hotel-room-1285156_960_720.jpg" class="room-image" />
                <div class="room-content">
                    <div class="d-flex justify-content-between">
                        <div class="room-title">Phòng Suite</div>
                        <div class="room-badge">🌟 VIP</div>
                    </div>
                    <div class="room-rating">⭐ ⭐ ⭐ ⭐ ⭐</div>
                    <p class="room-desc">Không gian sang trọng, phòng khách riêng, bồn tắm thư giãn.</p>
                    <div class="room-price">3.500.000 VND/đêm</div>
                    <div>
                        <a href="#" class="btn-detail">Xem chi tiết</a>
                        <a href="#" class="btn-book">Đặt phòng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />
