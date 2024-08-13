<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Cliente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="../css/principal.css" rel="stylesheet" type="text/css"/>
        <style>
            .form-container {
                max-width: 600px;
                margin: 30px auto;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                background-color: #fff;
            }
            .form-group label {
                font-weight: bold;
            }
            .btn-custom {
                margin-top: 20px;
            }
        </style>
        <script src="../JS/UpdateTime.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <!--<a class="navbar-brand" href="#">Logo</a>-->
                <img class="navbar-brand" src="images/logo.png" height="60px" width="60px" href="#" alt=""/>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark" aria-current="page" href="cliente?action">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#">Tablas</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Gestion de Productos</a></li>
                                <li><a class="dropdown-item" href="cliente?action=listar">Gestion de Clientes</a></li>
                                <li><a class="dropdown-item" href="gestionProveedores.jsp">Gestion de Proveedores</a></li>     
                                <li><a class="dropdown-item" href="#">Gestion de Usuarios</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#">Ventas</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="AperturarTurno.jsp">Aperturar Venta</a></li>
                                <li><a class="dropdown-item" href="#">Correlativo de Pedidos</a></li>
                                <li><a class="dropdown-item" href="#">Correlativo de Documentos</a></li>
                                <li><a class="dropdown-item" href="vistas/gestionCuentaCorriente.jsp">Cuentas Corrientes</a></li>
                                <li><a class="dropdown-item" href="CierreTurno.jsp">Cierre de Venta</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#">Almacen</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Registrar Stock</a></li>
                                <li><a class="dropdown-item" href="GestionDocumentodeCompra.jsp">Registrar Compras</a></li>
                                <li><a class="dropdown-item" href="#">Registrar Merma</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#">Reportes</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Liquidacion de Venta</a></li>
                                <li><a class="dropdown-item" href="#">Registro de Ventas</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div  class="btn-group dropstart">
                    <button style="border:none;" class="btn btn-outline-light dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="images/user.png" alt=""/>
                    </button>
                    <ul class="dropdown-menu ">
                        <li><a class="dropdown-item" href="#"></a></li>
                        <li><a class="dropdown-item" href="#">Usuario <%= session.getAttribute("username")%></a></li>                        
                        <li><a class="dropdown-item" href="#">Usuario@gmail.com</a></li>
                        <div class="dropdown-divider"></div>
                        <li><a class="dropdown-item" href="logout.jsp">Salir</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="form-container">
                <h1 class="text-center">Editar Cliente</h1>
                <form action="cliente?action=actualizar" method="post">
                    <input type="hidden" name="id" value="<c:out value='${cliente.IDCliente}' />">
                    <div class="form-group">
                        <label for="razonSocial">Razón Social:</label>
                        <input type="text" class="form-control" id="razonSocial" name="razonSocial" value="<c:out value='${cliente.razonSocial}' />" required>
                    </div>
                    <div class="form-group">
                        <label for="razonComercial">Razón Comercial:</label>
                        <input type="text" class="form-control" id="razonComercial" name="razonComercial" value="<c:out value='${cliente.razonComercial}' />">
                    </div>
                    <div class="form-group">
                        <label for="nombres">Nombres:</label>
                        <input type="text" class="form-control" id="nombres" name="nombres" value="<c:out value='${cliente.nombres}' />" required>
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" value="<c:out value='${cliente.apellidos}' />" required>
                    </div>
                    <div class="form-group">
                        <label for="idTributario">ID Tributario:</label>
                        <input type="text" class="form-control" id="idTributario" name="idTributario" value="<c:out value='${cliente.idTributario}' />" required>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo" value="<c:out value='${cliente.correo}' />" required>
                    </div>
                    <div class="form-group">
                        <label for="idUsuario">ID Usuario:</label>
                        <input type="text" class="form-control" id="idUsuario" name="idUsuario" value="<c:out value='${cliente.IDUsuario}' />" readonly>
                    </div>
                    <div class="btn-custom">
                        <button type="submit" class="btn btn-primary">Actualizar Cliente</button>
                        <a href="cliente?action=listar" class="btn btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer-bar">
            <span id="date"></span>
            <span id="time"></span>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>