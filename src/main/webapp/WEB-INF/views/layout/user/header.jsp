<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>DavidSuoi Hotel</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Open+Sans&display=swap"
            rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Open Sans', sans-serif;
                background-color: #fdfcf7;
                color: #222;
            }

            header {
                background: linear-gradient(135deg, #1b5e20, #2e7d32);
                /* Gucci xanh đậm */
                padding: 3rem 2rem;
                text-align: center;
                border-bottom: 4px solid #d4af37;
                /* Gold line */
                color: white;
            }

            header h1 {
                font-family: 'Playfair Display', serif;
                font-size: 3rem;
                letter-spacing: 2px;
                margin-bottom: 0.5rem;
            }

            header p {
                font-size: 1.2rem;
                color: #f1f8e9;
            }

            nav {
                background: #388e3c;
                /* xanh nhạt hơn */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .nav-container {
                max-width: 1200px;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                padding: 1rem 2rem;
                flex-wrap: wrap;
            }

            .nav-container a {
                color: #fff;
                text-decoration: none;
                margin: 0 1.5rem;
                font-size: 1.1rem;
                font-weight: 600;
                position: relative;
                transition: all 0.3s ease;
            }

            .nav-container a::after {
                content: '';
                position: absolute;
                bottom: -6px;
                left: 50%;
                transform: translateX(-50%);
                height: 2px;
                width: 0;
                background: #f9d342;
                /* vàng ánh kim */
                transition: width 0.3s ease;
            }

            .nav-container a:hover::after {
                width: 100%;
            }

            .nav-container a:hover {
                color: #f9d342;
            }

            @media (max-width: 768px) {
                .nav-container {
                    justify-content: center;
                    padding: 1rem;
                }

                .nav-container a {
                    margin: 0.5rem 1rem;
                }
            }
        </style>
    </head>

    <body>
        <header>
            <h1>DavidSuoi - Hotel</h1>
        </header>

        <nav>
            <div class="nav-container">
                <a href="/user/home">Trang chủ</a>
                <a href="/user/bookings">Đặt phòng</a>
                <a href="/user/history">Lịch sử</a>
            </div>
        </nav>
