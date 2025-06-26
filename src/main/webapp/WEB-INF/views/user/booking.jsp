<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<div class="booking-container">
    <h2>Lịch sử đặt phòng</h2>

    <table class="booking-table">
        <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Loại phòng</th>
                <th>Khách sạn</th>
                <th>Ngày nhận</th>
                <th>Ngày trả</th>
                <th>Giá</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>#BK001</td>
                <td>Phòng Deluxe</td>
                <td>Việt Trì Garden</td>
                <td>20/06/2025</td>
                <td>23/06/2025</td>
                <td>6.000.000 VNĐ</td>
                <td><span class="status confirmed">Đã xác nhận</span></td>
            </tr>
            <tr>
                <td>#BK002</td>
                <td>Phòng Executive</td>
                <td>Việt Trì Garden</td>
                <td>10/07/2025</td>
                <td>12/07/2025</td>
                <td>6.000.000 VNĐ</td>
                <td><span class="status pending">Đang chờ</span></td>
            </tr>
            <tr>
                <td>#BK003</td>
                <td>Phòng Gia Đình</td>
                <td>Việt Trì Garden</td>
                <td>05/08/2025</td>
                <td>08/08/2025</td>
                <td>12.000.000 VNĐ</td>
                <td><span class="status cancelled">Đã hủy</span></td>
            </tr>
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />

<style>
    body {
        font-family: 'Open Sans', sans-serif;
        background-color: #fffdf8;
    }

    .booking-container {
        max-width: 1100px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .booking-container h2 {
        text-align: center;
        color: #2e7d32;
        margin-bottom: 1.5rem;
        font-size: 2rem;
    }

    .booking-table {
        width: 100%;
        border-collapse: collapse;
    }

    .booking-table th,
    .booking-table td {
        padding: 1rem;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    .booking-table th {
        background-color: #e8f5e9;
        color: #1b5e20;
        font-weight: 600;
    }

    .booking-table tr:hover {
        background-color: #f9fbe7;
    }

    .status {
        padding: 0.4rem 0.8rem;
        border-radius: 20px;
        font-weight: 600;
        font-size: 0.95rem;
    }

    .status.confirmed {
        background-color: #a5d6a7;
        color: #1b5e20;
    }

    .status.pending {
        background-color: #fff59d;
        color: #f57f17;
    }

    .status.cancelled {
        background-color: #ef9a9a;
        color: #c62828;
    }
</style>
