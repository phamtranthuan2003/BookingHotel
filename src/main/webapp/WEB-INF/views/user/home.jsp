<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<div class="container my-5">
    <h2 class="text-center mb-5 text-success fw-bold">Danh sách phòng</h2>

    <div class="row g-4">
        <!-- Phòng Deluxe -->
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="https://lavenderstudio.com.vn/wp-content/uploads/2017/03/chup-khach-san-dep-tphcm.jpg" class="card-img-top" alt="Phòng Deluxe">
                <div class="card-body text-center">
                    <h5 class="card-title">Phòng Deluxe</h5>
                    <p class="card-text"><strong class="text-warning">2.000.000 VNĐ</strong>/đêm</p>
                    <p class="card-text">Tiện nghi: Wi-Fi miễn phí, TV màn hình phẳng, minibar.</p>
                    <a href="#" class="btn btn-success rounded-pill">Đặt phòng</a>
                </div>
            </div>
        </div>

        <!-- Phòng Executive -->
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="https://www.jaybranding.com/wp-content/uploads/2023/03/KJJ_1687-1000x667.jpg" class="card-img-top" alt="Phòng Executive">
                <div class="card-body text-center">
                    <h5 class="card-title">Phòng Executive</h5>
                    <p class="card-text"><strong class="text-warning">3.000.000 VNĐ</strong>/đêm</p>
                    <p class="card-text">Tiện nghi: Wi-Fi miễn phí, bồn tắm jacuzzi, dịch vụ phòng 24/7.</p>
                    <a href="#" class="btn btn-success rounded-pill">Đặt phòng</a>
                </div>
            </div>
        </div>

        <!-- Phòng Gia Đình -->
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="https://kconceptvn.com/wp-content/uploads/2020/04/hotel-photography-chup-anh-khach-san-khach-san-bamboo-sapa-hotel-18-1024x683.jpg" class="card-img-top" alt="Phòng Gia Đình">
                <div class="card-body text-center">
                    <h5 class="card-title">Phòng Gia Đình</h5>
                    <p class="card-text"><strong class="text-warning">4.000.000 VNĐ</strong>/đêm</p>
                    <p class="card-text">Tiện nghi: Wi-Fi miễn phí, không gian rộng rãi, nhà bếp nhỏ.</p>
                    <a href="#" class="btn btn-success rounded-pill">Đặt phòng</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />
