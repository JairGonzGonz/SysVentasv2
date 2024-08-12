
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.ProveedorDAO" %>
<%@ page import="modelo.Proveedor" %>
<%@ page import='java.util.List' %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregar Proveedor</h1>
        <form action="Controlador?accion=listar">
            <label>
                RUC:<br>
                <input type="text" name="RUCProveedor" >
            </label>
            <br>
            <label>
                Razon Social:<br>
                <input type="text" name="razonSocial">
            </label>
            <br>
            <label>
                Razon Comercial:<br>
                <input type="text" name="razonComercial">
            </label>
            <br>
            <label>
                Correo:<br>
                <input type="email" name="correo">
            </label>
            <br>
            <label>
                Telefono:<br>
                <input type="text" name="telefono">
            </label>
            <button type="submit" name="accion" value="agregar">Agregar</button>
        </form>
    </body>
</html>
