<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
<div class="main-content">
    <h4><i class="bi bi-bar-chart-line"></i> Thống kê hệ thống</h4>

    <!-- Tổng quan -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card text-white bg-primary shadow-sm">
                <div class="card-body">
                    <h6>Tổng khách sạn</h6>
                    <h4>${totalHotels}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success shadow-sm">
                <div class="card-body">
                    <h6>Tổng phòng</h6>
                    <h4>${totalRooms}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-warning shadow-sm">
                <div class="card-body">
                    <h6>Lượt đặt phòng</h6>
                    <h4>${totalBookings}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger shadow-sm">
                <div class="card-body">
                    <h6>Doanh thu (VNĐ)</h6>
                    <h4><fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="₫" /></h4>
                </div>
            </div>
        </div>
    </div>

    <!-- Biểu đồ doanh thu -->
    <div class="card">
        <div class="card-header bg-light">
            <strong><i class="bi bi-graph-up"></i> Biểu đồ doanh thu theo tháng</strong>
        </div>
        <div class="card-body">
            <canvas id="revenueChart" height="80"></canvas>
        </div>
    </div>
</div>
</div>
</body>
</html>