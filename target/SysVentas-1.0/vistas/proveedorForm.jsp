<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Proveedor"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Nuevo Proveedor</title>
</head>
<body>

    <div class="container mt-4">
        <h1><%= request.getParameter("accion").equals("editar") ? "Editar Proveedor" : "Nuevo Proveedor" %></h1>

        <% Proveedor proveedor = (Proveedor) request.getAttribute("proveedor"); %>

        <form action="proveedor" method="post">
            <input type="hidden" name="accion" value="<%= proveedor != null ? "actualizar" : "insertar" %>">
            <% if (proveedor != null) { %>
                <input type="hidden" name="RUCProveedor" value="<%= proveedor.getRUCProveedor() %>">
            <% } %>

            <div class="mb-3">
                <label for="RUCProveedor" class="form-label">RUC Proveedor:</label>
                <input type="text" class="form-control" id="RUCProveedor" name="RUCProveedor" value="<%= proveedor != null ? proveedor.getRUCProveedor() : "" %>" <%= proveedor != null ? "readonly" : "" %>>
            </div>

            <div class="mb-3">
                <label for="razonSocial" class="form-label">Razón Social:</label>
                <input type="text" class="form-control" id="razonSocial" name="razonSocial" value="<%= proveedor != null ? proveedor.getRazonSocial() : "" %>">
            </div>

            <div class="mb-3">
                <label for="razonComercial" class="form-label">Razón Comercial:</label>
                <input type="text" class="form-control" id="razonComercial" name="razonComercial" value="<%= proveedor != null ? proveedor.getRazonComercial() : "" %>">
            </div>

            <div class="mb-3">
                <label for="correo" class="form-label">Correo:</label>
                <input type="email" class="form-control" id="correo" name="correo" value="<%= proveedor != null ? proveedor.getCorreo() : "" %>">
            </div>

            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="tel" class="form-control" id="telefono" name="telefono" value="<%= proveedor != null ? proveedor.getTelefono() : "" %>">
            </div>

            <div class="mb-3">
                <label for="diasCredito" class="form-label">Días de Crédito:</label>
                <input type="number" class="form-control" id="diasCredito" name="diasCredito" value="<%= proveedor != null ? proveedor.getDiasCredito() : "" %>">
            </div>

            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
