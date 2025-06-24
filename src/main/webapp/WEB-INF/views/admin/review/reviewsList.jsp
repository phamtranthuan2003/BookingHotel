<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %>

<div class="main-content">
    <h4><i class="bi bi-star-fill"></i> Quản lý đánh giá</h4>

    <!-- Thông báo nếu cần -->
    <div class="alert alert-success" role="alert">
        <!-- Nội dung thông báo nếu có -->
    </div>

    <!-- Bảng danh sách đánh giá -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle bg-white shadow-sm text-center">
            <thead class="table-success">
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
                <c:forEach items="${reviews}" var="review" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${review.customer.name}</td>
                        <td>${review.hotel.name}</td>
                        <td>${review.comment}</td>
                        <td>${review.rating} ⭐</td>
                        <td>${review.createdAtFormatted}</td>
                        <td>
                            <c:choose>
                                <c:when test="${review.status == 'HIDE'}">
                                    <span class="badge bg-secondary">Đã ẩn</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-success">Hiển thị</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${review.status == 'HIDE'}">
                                    <a href="/admin/reviewsShow/${review.id}"
                                        class="btn btn-sm btn-success" title="Hiện lại đánh giá">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/admin/reviewsHide/${review.id}"
                                        class="btn btn-sm btn-secondary" title="Ẩn đánh giá">
                                        <i class="bi bi-eye-slash"></i>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <a href="/admin/deleteReview/${review.id}" class="btn btn-sm btn-danger"
                                title="Xóa"
                                onclick="return confirm('Bạn có chắc muốn xóa đánh giá này?');">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>