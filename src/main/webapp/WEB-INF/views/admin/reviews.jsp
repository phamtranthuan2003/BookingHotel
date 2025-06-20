<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>
<div class="main-content">
    <h4><i class="bi bi-star-fill"></i> Quản lý đánh giá</h4>

    <!-- Thông báo nếu cần -->
    <div class="alert alert-success" role="alert">
        <!-- Nội dung thông báo -->
    </div>

    <!-- Bảng danh sách đánh giá -->
    <div class="table-responsive">
        <table class="table table-bordered align-middle text-center">
            <thead class="table-warning">
                <tr>
                    <th>#</th>
                    <th>Khách hàng</th>
                    <th>Khách sạn</th>
                    <th>Đánh giá</th>
                    <th>Sao</th>
                    <th>Ngày đánh giá</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Lê Thị B</td>
                    <td>Khách sạn ABC</td>
                    <td>Phòng sạch sẽ, dịch vụ tốt</td>
                    <td>5 ⭐</td>
                    <td>2025-06-20</td>
                    <td><span class="badge bg-success">Hiển thị</span></td>
                    <td>
                        <a href="/admin/review/hide/1" class="btn btn-sm btn-secondary"><i class="bi bi-eye-slash"></i></a>
                        <a href="/admin/review/delete/1" class="btn btn-sm btn-danger" onclick="return confirm('Xóa đánh giá này?')"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
                <!-- Các dòng dữ liệu khác -->
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>
