<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
    }

    h1, h3, h4, h5, h6 {
        font-weight: bold;
    }

    .section-title {
        color: #198754;
        margin-bottom: 1.5rem;
    }

    .feature-icon {
        font-size: 2.5rem;
        color: #198754;
    }

    .card-img-top {
        height: 250px;
        object-fit: cover;
    }

    .chatbox {
        width: 300px;
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 999;
    }

    .chatbox .card-body {
        max-height: 200px;
        overflow-y: auto;
        font-size: 0.9rem;
    }

    .rounded-circle {
        width: 100px;
        height: 100px;
        object-fit: cover;
    }

    .bg-highlight {
        background-color: #f8f9fa;
    }

    .btn-gucci {
        background-color: #198754;
        color: white;
        border: none;
    }

    .btn-gucci:hover {
        background-color: #146c43;
    }
</style>

<!-- Banner -->
<div class="container-fluid px-0">
    <img src="/assets/images/banner.png" class="img-fluid w-100" alt="Banner">
</div>

<!-- Giới thiệu -->
<div class="container mt-5">
    <div class="text-center mb-5">
        <h1 class="display-5">Khách sạn sang trọng & dịch vụ chuyên nghiệp</h1>
        <p class="lead">Tận hưởng kỳ nghỉ trọn vẹn với không gian thoải mái, tiện nghi và dịch vụ chu đáo.</p>
    </div>

    <!-- Tiện ích -->
    <div class="row text-center mb-5">
        <div class="col-md-3">
            <i class="bi bi-building feature-icon"></i>
            <h5 class="mt-2">Phòng cao cấp</h5>
            <p>Đa dạng loại phòng từ đơn đến suite.</p>
        </div>
        <div class="col-md-3">
            <i class="bi bi-wifi feature-icon"></i>
            <h5 class="mt-2">Wifi tốc độ cao</h5>
            <p>Miễn phí toàn khuôn viên khách sạn.</p>
        </div>
        <div class="col-md-3">
            <i class="bi bi-cup-straw feature-icon"></i>
            <h5 class="mt-2">Nhà hàng & bar</h5>
            <p>Ẩm thực đa dạng, phong cách hiện đại.</p>
        </div>
        <div class="col-md-3">
            <i class="bi bi-shield-check feature-icon"></i>
            <h5 class="mt-2">An toàn & tiện lợi</h5>
            <p>Bảo vệ 24/7, thanh toán linh hoạt.</p>
        </div>
    </div>

    <!-- Phòng nổi bật -->
    <div class="mb-5">
        <h3 class="mb-4 text-success">Phòng nổi bật</h3>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="i" begin="1" end="3">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="https://via.placeholder.com/400x250?text=Phòng+${i}" class="card-img-top" alt="Phòng ${i}">
                        <div class="card-body">
                            <h5 class="card-title">Phòng ${i} Deluxe</h5>
                            <p class="card-text">Không gian sang trọng, tiện nghi hiện đại, view đẹp.</p>
                            <p class="fw-bold text-danger">${i * 1.5} triệu VNĐ / đêm</p>
                            <a href="/user/room/${i}" class="btn btn-success btn-sm">Chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Ưu đãi -->
    <div class="mb-5 bg-light p-4 rounded shadow-sm">
        <h3 class="text-success">Ưu đãi đặc biệt tháng này</h3>
        <ul class="list-unstyled mt-3">
            <li><i class="bi bi-check-circle-fill text-success me-2"></i> Giảm 20% cho khách đặt phòng trước 7 ngày</li>
            <li><i class="bi bi-check-circle-fill text-success me-2"></i> Miễn phí đón sân bay cho đơn từ 3 đêm</li>
            <li><i class="bi bi-check-circle-fill text-success me-2"></i> Tặng voucher ăn sáng cho mỗi đặt phòng</li>
        </ul>
    </div>

    <!-- Đánh giá -->
    <div class="mb-5">
        <h3 class="mb-4 text-success">Khách hàng nói gì?</h3>
        <div class="row row-cols-1 row-cols-md-2 g-3">
            <div class="col">
                <div class="card shadow-sm p-3">
                    <p>"Dịch vụ tuyệt vời, phòng sạch sẽ, view đẹp!"</p>
                    <p class="mb-0 text-muted">— Khánh Linh, 21/06/2025</p>
                    <span class="text-warning">5 ⭐</span>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm p-3">
                    <p>"Nhân viên thân thiện, đồ ăn ngon, gần biển."</p>
                    <p class="mb-0 text-muted">— Quốc Huy, 19/06/2025</p>
                    <span class="text-warning">4 ⭐</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Blog / Tin tức -->
    <div class="mb-5">
        <h3 class="mb-4 text-success">Tin tức & Du lịch</h3>
        <div class="row row-cols-1 row-cols-md-2 g-3">
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/600x300?text=Blog+1" class="card-img-top" alt="Blog 1">
                    <div class="card-body">
                        <h5 class="card-title">Top 5 điểm du lịch không thể bỏ qua tại Đà Nẵng</h5>
                        <p class="card-text">Cùng khám phá những địa điểm hot nhất mùa hè này...</p>
                        <a href="#" class="btn btn-outline-success btn-sm">Đọc tiếp</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/600x300?text=Blog+2" class="card-img-top" alt="Blog 2">
                    <div class="card-body">
                        <h5 class="card-title">Bí quyết đặt phòng tiết kiệm chi phí</h5>
                        <p class="card-text">Đừng bỏ qua các mẹo nhỏ giúp bạn đặt phòng giá tốt...</p>
                        <a href="#" class="btn btn-outline-success btn-sm">Đọc tiếp</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Liên hệ -->
    <div class="text-center mt-5">
        <h5>Bạn cần hỗ trợ?</h5>
        <a href="/user/contact" class="btn btn-outline-success btn-sm mt-2">Liên hệ chúng tôi</a>
    </div>
    <!-- Bản đồ khách sạn -->
<div class="container my-5">
    <h3 class="mb-4 text-success">Tìm chúng tôi trên bản đồ</h3>
    <div class="ratio ratio-16x9 shadow rounded overflow-hidden">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.3546493863893!2d106.700806075951!3d10.786348389363776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f2797614a4f%3A0x5e6ae5fa64cb5f55!2sBen%20Thanh%20Market!5e0!3m2!1sen!2s!4v1719236000000"
            style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</div>

<!-- Số liệu thống kê -->
<div class="bg-success text-white text-center py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h1 class="display-4">+120</h1>
                <p>Phòng đang hoạt động</p>
            </div>
            <div class="col-md-4">
                <h1 class="display-4">+25</h1>
                <p>Khách sạn hợp tác</p>
            </div>
            <div class="col-md-4">
                <h1 class="display-4">+9.500</h1>
                <p>Đánh giá hài lòng</p>
            </div>
        </div>
    </div>
</div>

<!-- Danh sách đối tác -->
<div class="container my-5">
    <h3 class="mb-4 text-success">Đối tác chiến lược</h3>
    <div class="row row-cols-2 row-cols-md-4 g-3 text-center align-items-center">
        <c:forEach begin="1" end="4" var="i">
            <div class="col">
                <img src="https://via.placeholder.com/150x80?text=Logo+${i}" class="img-fluid" alt="Partner ${i}">
            </div>
        </c:forEach>
    </div>
</div>

<!-- Câu hỏi thường gặp -->
<div class="container my-5">
    <h3 class="mb-4 text-success">Câu hỏi thường gặp</h3>
    <div class="accordion" id="faqAccordion">
        <div class="accordion-item">
            <h2 class="accordion-header" id="q1">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#a1">
                    Làm thế nào để đặt phòng?
                </button>
            </h2>
            <div id="a1" class="accordion-collapse collapse show">
                <div class="accordion-body">
                    Bạn chỉ cần chọn phòng yêu thích, điền thông tin và nhấn “Đặt phòng”.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="q2">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a2">
                    Có hoàn tiền nếu hủy phòng không?
                </button>
            </h2>
            <div id="a2" class="accordion-collapse collapse">
                <div class="accordion-body">
                    Tùy vào chính sách khách sạn. Vui lòng xem chi tiết khi đặt phòng.
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chatbox giả lập -->
<div class="position-fixed bottom-0 end-0 m-4" style="z-index:999;">
    <div class="card shadow" style="width: 300px;">
        <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
            <span>Hỗ trợ trực tuyến</span>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="card" aria-label="Close"></button>
        </div>
        <div class="card-body small" style="max-height: 200px; overflow-y: auto;">
            <p><strong>Bot:</strong> Xin chào! Bạn cần giúp gì không?</p>
        </div>
        <div class="card-footer">
            <input type="text" class="form-control form-control-sm" placeholder="Nhập tin nhắn...">
        </div>
    </div>
</div>

<!-- CTA cuối trang -->
<div class="bg-light text-center py-5">
    <h4 class="mb-3">Sẵn sàng cho chuyến đi tiếp theo?</h4>
    <a href="/user/room" class="btn btn-gucci btn-lg">Đặt phòng ngay</a>
</div>
<div class="container my-5">
    <h3 class="mb-4 text-success">Khám phá địa điểm hot</h3>
    <div class="row row-cols-1 row-cols-md-4 g-3">
        <div class="col text-center">
            <img src="https://via.placeholder.com/150" class="rounded-circle mb-2" alt="Đà Lạt">
            <h6>Đà Lạt</h6>
        </div>
        <div class="col text-center">
            <img src="https://via.placeholder.com/150" class="rounded-circle mb-2" alt="Đà Nẵng">
            <h6>Đà Nẵng</h6>
        </div>
        <div class="col text-center">
            <img src="https://via.placeholder.com/150" class="rounded-circle mb-2" alt="Phú Quốc">
            <h6>Phú Quốc</h6>
        </div>
        <div class="col text-center">
            <img src="https://via.placeholder.com/150" class="rounded-circle mb-2" alt="Sapa">
            <h6>Sapa</h6>
        </div>
    </div>
</div>
<div class="bg-light py-5">
    <div class="container">
        <h3 class="text-success text-center mb-4">Tại sao chọn Hotel Booking?</h3>
        <div class="row text-center">
            <div class="col-md-3">
                <i class="bi bi-clock-history fs-2 text-success"></i>
                <h6 class="mt-2">Đặt phòng 24/7</h6>
            </div>
            <div class="col-md-3">
                <i class="bi bi-cash-stack fs-2 text-success"></i>
                <h6 class="mt-2">Giá ưu đãi nhất</h6>
            </div>
            <div class="col-md-3">
                <i class="bi bi-shield-check fs-2 text-success"></i>
                <h6 class="mt-2">Thanh toán an toàn</h6>
            </div>
            <div class="col-md-3">
                <i class="bi bi-star-fill fs-2 text-success"></i>
                <h6 class="mt-2">Đánh giá thật 100%</h6>
            </div>
        </div>
    </div>
</div>

</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />
