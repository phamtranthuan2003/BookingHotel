<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />

<div class="history-container">
    <h2>Lịch sử đặt phòng của bạn</h2>

    <c:choose>
        <c:when test="${not empty bookings}">
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Mã đặt phòng</th>
                        <th>Loại phòng</th>
                        <th>Ngày nhận</th>
                        <th>Ngày trả</th>
                        <th>Giá</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${bookings}">
                        <tr>
                            <td>${b.code}</td>
                            <td>${b.roomType}</td>
                            <td>${b.checkin}</td>
                            <td>${b.checkout}</td>
                            <td>${b.price} VNĐ</td>
                            <td>
                                <span class="status ${b.status}">
                                    <c:choose>
                                        <c:when test="${b.status eq 'confirmed'}">Đã xác nhận</c:when>
                                        <c:when test="${b.status eq 'pending'}">Đang chờ</c:when>
                                        <c:otherwise>Đã hủy</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="no-bookings">
                <p>Bạn chưa có lịch sử đặt phòng nào.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/views/layout/user/footer.jsp" />

<style>
    .history-container {
        max-width: 1100px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .history-container h2 {
        text-align: center;
        color: #2e7d32;
        margin-bottom: 2rem;
        font-size: 2rem;
    }

    .history-table {
        width: 100%;
        border-collapse: collapse;
    }

    .history-table th,
    .history-table td {
        padding: 1rem;
        text-align: center;
        border-bottom: 1px solid #e0e0e0;
    }

    .history-table th {
        background-color: #f0f4c3;
        color: #1b5e20;
        font-weight: 600;
    }

    .history-table tr:hover {
        background-color: #fcfce7;
    }

    .status {
        padding: 0.3rem 0.7rem;
        border-radius: 20px;
        font-weight: bold;
        text-transform: capitalize;
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

    .no-bookings {
        text-align: center;
        padding: 3rem 1rem;
        font-size: 1.2rem;
        color: #757575;
    }
</style>
