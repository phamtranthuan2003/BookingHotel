<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/layout/admin/header.jsp" />
<div class="container mt-5">
    <h2 class="mb-4">Danh sách bài viết</h2>

    <a href="/admin/blogs/create" class="btn btn-primary mb-3">
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
        <c:forEach var="post" items="${posts}">
            <tr>
                <td>${post.id}</td>
                <td>${post.title}</td>
                <td>${post.author}</td>
                <td>${post.createdAt}</td>
                <td>
                    <a href="/admin/blogs/edit/${post.id}" class="btn btn-sm btn-warning">Sửa</a>
                    <a href="/admin/blogs/delete/${post.id}" class="btn btn-sm btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xoá bài viết này không?');">Xoá</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
