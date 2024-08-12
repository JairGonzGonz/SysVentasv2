<%-- 
    Document   : logout
    Created on : 15 jul. 2024, 3:37:02 p. m.
    Author     : GONZCORP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sesión cerrada</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/logout.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="logout-container">
                        <div class="icon">&#10004;</div>
                        <h2 class="mb-4">Sesión cerrada</h2>
                        <p class="mb-4">Has cerrado sesión correctamente. ¡Gracias por usar nuestro servicio!</p>
                        <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary">Volver al inicio de sesión</a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>