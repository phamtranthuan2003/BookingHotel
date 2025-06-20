<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Danh sách phòng</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous" />
        <!-- Google Fonts for 'Playfair Display' and 'Open Sans' -->
        <link
            href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Open+Sans:wght@400;600&display=swap"
            rel="stylesheet" />
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
        </style>
    </head>

    <body>
        <!-- Header Section -->
        <!-- This part would typically be in your /WEB-INF/views/layout/user/header.jsp -->
        <header class="bg-light py-3 shadow-sm">
            <div class="container d-flex flex-wrap justify-content-between align-items-center">
                <a href="/user/home" class="text-success text-decoration-none fs-4 fw-bold">Hotel Booking</a>
                <nav class="d-flex flex-wrap gap-3">
                    <a href="/user/home" class="text-dark me-3 text-decoration-none fw-semibold">Trang chủ</a>
                    <a href="/user/rooms" class="text-dark me-3 text-decoration-none fw-semibold">Phòng</a>
                    <a href="/user/contact" class="text-dark text-decoration-none fw-semibold">Liên hệ</a>
                    <a href="/user/booking" class="text-dark text-decoration-none fw-semibold">Bookings</a>
                </nav>
            </div>
        </header>
