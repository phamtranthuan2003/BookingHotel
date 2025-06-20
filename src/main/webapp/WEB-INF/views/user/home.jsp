<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />
<!-- Body Section (Main Content) -->
    <!-- This is the core content you would have in your main JSP page -->
    <div class="container my-5">
        <h2 class="text-center mb-5 gucci-heading">Danh sách phòng</h2>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Phòng Deluxe -->
            <div class="col">
                <div class="card room-card h-100">
                    <img src="https://lavenderstudio.com.vn/wp-content/uploads/2017/03/chup-khach-san-dep-tphcm.jpg" class="card-img-top" alt="Phòng Deluxe">
                    <div class="card-body text-center">
                        <h5 class="card-title">Phòng Deluxe</h5>
                        <p class="room-price">2.000.000 VNĐ / đêm</p>
                        <p class="card-text">Wi-Fi miễn phí, TV phẳng, minibar, tầm nhìn thành phố.</p>
                        <a href="#" class="btn btn-gucci">Đặt phòng</a>
                    </div>
                </div>
            </div>

            <!-- Phòng Executive -->
            <div class="col">
                <div class="card room-card h-100">
                    <img src="https://www.jaybranding.com/wp-content/uploads/2023/03/KJJ_1687-1000x667.jpg" class="card-img-top" alt="Phòng Executive">
                    <div class="card-body text-center">
                        <h5 class="card-title">Phòng Executive</h5>
                        <p class="room-price">3.000.000 VNĐ / đêm</p>
                        <p class="card-text">Bồn tắm jacuzzi, dịch vụ phòng 24/7, ban công riêng.</p>
                        <a href="#" class="btn btn-gucci">Đặt phòng</a>
                    </div>
                </div>
            </div>

            <!-- Phòng Gia Đình -->
            <div class="col">
                <div class="card room-card h-100">
                    <img src="https://kconceptvn.com/wp-content/uploads/2020/04/hotel-photography-chup-anh-khach-san-khach-san-bamboo-sapa-hotel-18-1024x683.jpg" class="card-img-top" alt="Phòng Gia Đình">
                    <div class="card-body text-center">
                        <h5 class="card-title">Phòng Gia Đình</h5>
                        <p class="room-price">4.000.000 VNĐ / đêm</p>
                        <p class="card-text">Không gian rộng, bếp nhỏ, Wi-Fi mạnh, 2 phòng ngủ.</p>
                        <a href="#" class="btn btn-gucci">Đặt phòng</a>
                    </div>
                </div>
            </div>

            <!-- Thêm Phòng Vip Suite -->
            <div class="col">
                <div class="card room-card h-100">
                    <img src="https://khachsanbonmua.com/wp-content/uploads/2023/05/thiet-ke-phong-ngu-khach-san-5-sao.jpg" class="card-img-top" alt="Phòng Vip Suite">
                    <div class="card-body text-center">
                        <h5 class="card-title">Phòng Vip Suite</h5>
                        <p class="room-price">6.000.000 VNĐ / đêm</p>
                        <p class="card-text">Tầm nhìn biển, quản gia riêng, tiện nghi cao cấp.</p>
                        <a href="#" class="btn btn-gucci">Đặt phòng</a>
                    </div>
                </div>
            </div>

            <!-- Thêm Phòng Standard -->
            <div class="col">
                <div class="card room-card h-100">
                    <img src="https://khachsanbonmua.com/wp-content/uploads/2023/05/phong-khach-san-co-ban-1.jpg" class="card-img-top" alt="Phòng Standard">
                    <div class="card-body text-center">
                        <h5 class="card-title">Phòng Standard</h5>
                        <p class="room-price">1.500.000 VNĐ / đêm</p>
                        <p class="card-text">Phòng thoải mái, đầy đủ tiện nghi cơ bản.</p>
                        <a href="#" class="btn btn-gucci">Đặt phòng</a>
                    </div>
                </div>
            </div>

            <!-- Thêm Phòng Twin -->
            <div class="col">
                <div class="card room-card h-100">
                    <img src="https://dcv.vn/wp-content/uploads/2020/07/thiet-ke-phong-twin-giuong-doi-1024x768.jpg" class="card-img-top" alt="Phòng Twin">
                    <div class="card-body text-center">
                        <h5 class="card-title">Phòng Twin</h5>
                        <p class="room-price">2.200.000 VNĐ / đêm</p>
                        <p class="card-text">Hai giường đơn, phù hợp cho bạn bè hoặc đồng nghiệp.</p>
                        <a href="#" class="btn btn-gucci">Đặt phòng</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />