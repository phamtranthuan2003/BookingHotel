<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/layout/admin/header.jsp" />
<div class="main-content">
    <h4><i class="bi bi-calendar-check"></i> Quản lý đặt phòng</h4>

    <!-- Nút thêm mới -->
    <div class="text-end mb-3">
        <a href="/admin/booking/add" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Thêm đặt phòng
        </a>
    </div>
    <!-- Thông báo thành công (nếu có) -->
    <div class="alert alert-success" role="alert">
        <!-- Thêm nội dung thông báo ở đây nếu cần -->
    </div>
    <!-- Bảng dữ liệu -->
    <div class="table-responsive">
        <table class="table table-bordered align-middle text-center">
            <thead class="table-success">
                <tr>
                    <th>#</th>
                    <th>Tên khách</th>
                    <th>Khách sạn</th>
                    <th>Phòng</th>
                    <th>Ngày nhận</th>
                    <th>Ngày trả</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Nguyễn Văn A</td>
                    <td>Khách sạn ABC</td>
                    <td>Phòng VIP 101</td>
                    <td>20/06/2025</td>
                    <td>22/06/2025</td>
                    <td><span class="badge bg-warning text-dark">Chờ xác nhận</span></td>
                    <td>
                        <a href="/admin/booking/edit/1" class="btn btn-sm btn-primary"><i class="bi bi-pencil-square"></i></a>
                        <a href="/admin/booking/delete/1" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?')"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
                <!-- Lặp thêm dữ liệu booking tại đây -->
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>
