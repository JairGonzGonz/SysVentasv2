<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="JS/UpdateTime.js" type="text/javascript"></script>
</head>
<body>
    <div class="title">
        <h1>Sistema de Ventas</h1>
        <h2>Comercial Aldair y Melina</h2>
    </div>
    <% if(request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %> 
    <div class="login-container">
        <img src="images/logo.png" alt="Company Logo">
        <form class="form-sign" action="login" method="POST">
            <div class="form-group">
                <label for="username">Usuario</label>
                <input type="text" class="form-control" name="username" placeholder="Ingrese su usuario" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" placeholder="Ingrese su contraseña" required>
            </div>
            <input type="submit"  value="Login" class="btn btn-primary btn-block">
        </form>
    </div>

    <div class="footer-bar">
        <span id="date"></span>
        <span id="time"></span>
    </div>
</body>
</html>
