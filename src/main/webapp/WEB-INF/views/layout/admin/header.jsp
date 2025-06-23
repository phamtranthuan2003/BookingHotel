<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Trang quản trị</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <h4>Admin Panel</h4>
            <% String uri=request.getRequestURI(); %>

                <a href="/admin/homes" class="nav-link <%= uri.contains("/admin/homes") ? "active" : "" %>"><i
                        class="bi bi-speedometer2"></i> Dashboard</a>
                <a href="/admin/hotels" class="nav-link <%= uri.contains("/admin/hotels") ? "active" : "" %>"><i
                        class="bi bi-building"></i> Khách sạn</a>
                <a href="/admin/rooms" class="nav-link <%= uri.contains("/admin/rooms") ? "active" : "" %>"><i
                        class="bi bi-door-open"></i> Phòng</a>
                <a href="/admin/bookings" class="nav-link <%= uri.contains("/admin/bookings") ? "active" : "" %>"><i
                        class="bi bi-calendar-check"></i> Đặt phòng</a>
                <a href="/admin/customers" class="nav-link <%= uri.contains("/admin/customers") ? "active" : "" %>"><i
                        class="bi bi-people"></i> Khách hàng</a>
                <a href="/admin/reviews" class="nav-link <%= uri.contains("/admin/reviews") ? "active" : "" %>"><i
                        class="bi bi-star-fill"></i> Đánh giá</a>
                <a href="/admin/statistics" class="nav-link <%= uri.contains("/admin/statistics") ? "active" : "" %>"><i
                        class="bi bi-bar-chart-line"></i> Thống kê</a>
                <a href="/logout" class="nav-link"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>

        </div>

















        <style>
            html,
            body {
                height: 100%;
                margin: 0;
                font-family: 'Open Sans', sans-serif;
            }

            .wrapper {
                display: flex;
                min-height: 100vh;
                background-color: #f4f6f9;
                /* dịu hơn */
            }

            /* Sidebar */
            .sidebar {
                width: 240px;
                background-color: #2c3e50;
                /* dịu hơn */
                color: #ecf0f1;
                flex-shrink: 0;
                padding-top: 1rem;
            }

            .sidebar h4 {
                font-weight: bold;
                text-align: center;
                margin-bottom: 2rem;
                color: #ecf0f1;
            }

            .nav-link {
                color: #ecf0f1;
                padding: 25px 20px;
                font-size: 15px;
                display: flex;
                align-items: center;
                gap: 10px;
                text-decoration: none;
            }

            .nav-link:hover {
                background-color: #34495e;
                /* dịu hơn, rõ nét */
            }

            .nav-link.active {
                background-color: #1abc9c;
                /* xanh ngọc nổi bật */
                color: white;
            }

            .nav-link i {
                font-size: 1.2rem;
            }

            .content-wrapper {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .main-content {
                flex: 1;
                padding: 30px;
                background-color: #f4f6f9;
            }

            footer {
                background-color: #ecf0f1;
                padding: 15px;
                text-align: center;
                font-size: 14px;
                color: #555;
            }

            @media (max-width: 768px) {
                .wrapper {
                    flex-direction: column;
                }

                .sidebar {
                    width: 100%;
                    display: flex;
                    flex-wrap: nowrap;
                    overflow-x: auto;
                }

                .nav-link {
                    flex: 1;
                    text-align: center;
                    font-size: 13px;
                    justify-content: center;
                }

                .sidebar h4 {
                    display: none;
                }
            }
        </style>