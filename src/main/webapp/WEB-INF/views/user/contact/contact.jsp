<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<style>
    .contact-info i {
        font-size: 1.5rem;
        color: #198754;
        margin-right: 10px;
    }

    .contact-form input, .contact-form textarea {
        border-radius: 0.5rem;
    }

    .contact-form .form-control:focus {
        box-shadow: none;
        border-color: #198754;
    }

    .map-responsive {
        overflow: hidden;
        padding-bottom: 56.25%;
        position: relative;
        height: 0;
    }

    .map-responsive iframe {
        left: 0;
        top: 0;
        height: 100%;
        width: 100%;
        position: absolute;
    }
</style>

<div class="container my-5">
    <h2 class="text-success text-center mb-4">Liên hệ với chúng tôi</h2>
    
    <div class="row g-4">
        <!-- Thông tin liên hệ -->
        <div class="col-md-5">
            <div class="contact-info mb-4">
                <p><i class="bi bi-geo-alt-fill"></i> ABC Trần Duy Hưng </p>
                <p><i class="bi bi-telephone-fill"></i> 0123456789</p>
                <p><i class="bi bi-envelope-fill"></i> info@davidsuoi.vn</p>
                <p><i class="bi bi-clock-fill"></i> Thứ 2 - Chủ Nhật: 8:00 - 22:00</p>
            </div>

            <div class="map-responsive shadow-sm rounded">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.6751301432485!2d105.77379567596018!3d21.00839498063495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab407f4d2c39%3A0x7a227b99b8e7ff8a!2zQuG6v24geGUgTcO5IMSQw61uaA!5e0!3m2!1svi!2s!4v1719249800000" 
                    width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy">
                </iframe>
            </div>
        </div>
        <!-- Form liên hệ -->
        <div class="col-md-7">
            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
            </c:if>
            <form action="/user/contact/send" method="post" class="contact-form bg-light p-4 shadow rounded">
                <div class="mb-3">
                    <label for="name" class="form-label">Họ và tên</label>
                    <input type="text" class="form-control" id="name" name="name" required placeholder="Nhập họ tên của bạn">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email liên hệ</label>
                    <input type="email" class="form-control" id="email" name="email" required placeholder="Nhập email của bạn">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" name="phone" required placeholder="Nhập số điện thoại của bạn">
                </div>
                <div class="mb-3">
                    <label for="subject" class="form-label">Chủ đề</label>
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Tiêu đề liên hệ">
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Nội dung</label>
                    <textarea class="form-control" id="message" name="message" rows="5" required placeholder="Nội dung tin nhắn..."></textarea>
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-success">Gửi liên hệ</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />
