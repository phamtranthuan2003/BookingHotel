<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/layout/user/header.jsp" />
<div class="container mt-5" style="max-width: 450px;">
    <h3 class="text-center mb-4">🔐 Đăng nhập</h3>

    <form id="loginForm">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="username" required autofocus>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        

        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <div class="mt-3 text-center">
        <a href="/user/forgotPassword">Quên mật khẩu?</a>
        <span class="mx-2">|</span>
        <a href="/user/signup">Đăng ký</a>
    </div>
</div>
</body>
</html>
<script>
document.getElementById("loginForm").addEventListener("submit", async function (e) {
    e.preventDefault();

    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    const response = await fetch("/api/user/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password })
    });

    const contentType = response.headers.get("Content-Type");
    if (contentType && contentType.includes("application/json")) {
        const data = await response.json();

        if (response.ok) {
            localStorage.setItem("token", data.token);

            if (data.role === "ROLE_ADMIN") {
                window.location.href = "/admin/homes";
            } else {
                window.location.href = "/";
            }
        } else {
            alert(data.error || "Đăng nhập thất bại");
        }
    } else {
        const text = await response.text();
        alert("Lỗi bất thường:\n" + text);
    }
});
</script>
