<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="/WEB-INF/views/layout/admin/header.jsp" />
    <div class="main-content">
        <h2 class="mb-4"><i class="bi bi-speedometer2 me-2"></i>Dashboard</h2>

        <!-- Thống kê nhanh -->
        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="card text-white bg-primary h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Tổng khách sạn</h5>
                                <h3>12</h3>
                            </div>
                            <i class="bi bi-building fs-1"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-white bg-success h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Phòng đang hoạt động</h5>
                                <h3>85</h3>
                            </div>
                            <i class="bi bi-door-open fs-1"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-white bg-warning h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Lượt đặt hôm nay</h5>
                                <h3>28</h3>
                            </div>
                            <i class="bi bi-calendar-check fs-1"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card text-white bg-danger h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Người dùng</h5>
                                <h3>324</h3>
                            </div>
                            <i class="bi bi-people fs-1"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Biểu đồ thống kê -->
        <div class="card shadow-sm">
            <div class="card-header bg-white">
                <h5 class="mb-0">Biểu đồ lượt đặt phòng (Demo)</h5>
            </div>
            <div class="card-body">
                <canvas id="bookingChart" height="80"></canvas>
            </div>
        </div>
    </div>
</div>
</body>
</html>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('bookingChart').getContext('2d');
        const bookingChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
                datasets: [{
                    label: 'Lượt đặt phòng',
                    data: [12, 19, 14, 23, 18, 25, 21],
                    backgroundColor: 'rgba(26, 188, 156, 0.2)',
                    borderColor: '#1abc9c',
                    borderWidth: 2,
                    tension: 0.3,
                    fill: true,
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' },
                    tooltip: { mode: 'index', intersect: false }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>