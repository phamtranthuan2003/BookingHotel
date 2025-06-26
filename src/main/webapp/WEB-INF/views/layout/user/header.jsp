<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh sách phòng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
</head>

<body>
<!-- Header -->
<header class="py-3 shadow-sm">
    <div class="container d-flex flex-wrap justify-content-between align-items-center">
        <!-- Logo -->
        <a href="/user/home" class="fs-4 fw-bold text-white text-decoration-none">🏨 Hotel Booking</a>

        <!-- Navigation -->
        <nav class="d-flex flex-wrap align-items-center gap-3">
            <a href="/user/home" class="text-white text-decoration-none fw-semibold">Trang chủ</a>
            <a href="/user/room" class="text-white text-decoration-none fw-semibold">Phòng</a>
            <a href="/user/contact" class="text-white text-decoration-none fw-semibold">Liên hệ</a>
            <a href="/user/booking" class="text-white text-decoration-none fw-semibold">Bookings</a>

            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <!-- Dropdown user -->
                    <div class="dropdown">
                        <a class="text-white text-decoration-none dropdown-toggle" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle fs-4"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/user/profile"><i
                                class="bi bi-person me-2"></i>Trang cá nhân</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item text-danger" href="/logout"><i
                                class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                        </ul>
                    </div>
                </c:when>

                <c:otherwise>
                    <a href="/user/login" class="btn btn-outline-light btn-sm">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
        var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
            return new bootstrap.Dropdown(dropdownToggleEl)
        });
    });
</script>
<style>
    header {
        background-color: #1b5e20;
        /* Gucci Green */
        color: white;
    }

    header a {
        color: white !important;
        transition: color 0.2s ease;
    }

    header a:hover {
        color: #d4af37 !important;
        /* Gucci Gold */
    }

    .btn-gucci {
        background: linear-gradient(to right, #1b5e20, #b71c1c);
        /* Gucci green to red */
        color: white;
        border: none;
        padding: 0.75rem 2rem;
        border-radius: 8px;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    .btn-gucci:hover {
        background: linear-gradient(to right, #388e3c, #c62828);
        transform: translateY(-2px);
    }

    .dropdown-menu {
        min-width: 180px;
        font-size: 0.95rem;
    }

    .dropdown-item:hover {
        background-color: #f0f0f0;
    }

    .dropdown-toggle {
        padding: 0;
        display: flex;
        align-items: center;
        border: none;
        background: none;
    }
</style>