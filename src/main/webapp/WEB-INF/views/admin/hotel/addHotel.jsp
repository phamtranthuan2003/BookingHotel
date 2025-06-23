<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm khách sạn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Thêm khách sạn mới</h2>

    <form:form method="POST" modelAttribute="hotel" action="${pageContext.request.contextPath}/admin/hotels/save">
        <div class="mb-3">
            <form:label path="name">Tên khách sạn</form:label>
            <form:input path="name" cssClass="form-control"/>
            <form:errors path="name" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <form:label path="address">Địa chỉ</form:label>
            <form:input path="address" cssClass="form-control"/>
            <form:errors path="address" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <form:label path="description">Mô tả</form:label>
            <form:textarea path="description" cssClass="form-control"/>
            <form:errors path="description" cssClass="text-danger"/>
        </div>

        <!-- <div class="mb-3">
            <form:label path="rating">Đánh giá</form:label>
            <form:input path="rating" type="hidden" cssClass="form-control"/>
            <form:errors path="rating" cssClass="text-danger"/>
        </div> -->

        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="${pageContext.request.contextPath}/admin/hotels" class="btn btn-secondary">Hủy</a>
    </form:form>
</div>
</body>
</html>
