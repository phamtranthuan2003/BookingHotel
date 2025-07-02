<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/admin/header.jsp" />

<div class="container mt-5">
    <h2 class="mb-4">Danh sách bài viết</h2>

    <a href="#" class="btn btn-primary mb-3">
        <i class="bi bi-plus-circle"></i> Thêm bài viết mới
    </a>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>#</th>
                <th>Tiêu đề</th>
                <th>Tác giả</th>
                <th>Ngày tạo</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Giới thiệu khách sạn ABC</td>
                <td>Nguyễn Văn A</td>
                <td>2024-05-12</td>
                <td>
                    <a href="/admin/blogs/edit/1" class="btn btn-sm btn-warning">Sửa</a>
                    <a href="/admin/blogs/delete/1" class="btn btn-sm btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xoá bài viết này không?');">Xoá</a>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Ưu đãi tháng 7</td>
                <td>Trần Thị B</td>
                <td>2024-07-01</td>
                <td>
                    <a href="/admin/blogs/edit/2" class="btn btn-sm btn-warning">Sửa</a>
                    <a href="/admin/blogs/delete/2" class="btn btn-sm btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xoá bài viết này không?');">Xoá</a>
                </td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>
