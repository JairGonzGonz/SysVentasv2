<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="../css/principal.css" rel="stylesheet" type="text/css"/>
        <title>Gestion de Productos</title>
        <script src="../JS/UpdateTime.js" type="text/javascript"></script>
        <style>
            .ocultar-columna {
                display: none;
            }
        </style>
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
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark" aria-current="page" href="../index.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#">Tablas</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="producto?action=listar">Gestion de Productos</a></li>
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
                                <li><a class="dropdown-item" href="gestionCuentaCorriente.jsp">Cuentas Corrientes</a></li>
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
        <div class="container mt-4">
            <h1>Gestion de Productos</h1>
            <a href="producto?action=mostrarFormularioRegistro" class="btn btn-success mb-3">Crear Nuevo Producto</a>
            <table class="table">
                <thead>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th>Resumida</th>
                    <th class="ocultar-columna">idUnidadMedida</th>
                    <th class="ocultar-columna">idClasificacion</th>
                    <th class="ocultar-columna">porcentajeImpuesto1</th>
                    <th class="ocultar-columna">porcentajeImpuesto2</th>
                    <th>Costo</th>
                    <th>Venta</th>
                    <th class="ocultar-columna">stockMinimo</th>
                    <th class="ocultar-columna">stock</th>
                    <th class="ocultar-columna">observacion</th>
                    <th class="ocultar-columna">fechaRegistro</th>
                    <th class="ocultar-columna">idUsuario</th>
                    <th>activo</th>
                    <th>Unidad Medida</th>
                    <th>Clasificacion</th>
                </thead>
                <tbody>
                    <!-- Itera sobre la lista de clientes -->
                    <c:forEach var="producto" items="${productos}">
                        <tr>
                            <td><c:out value="${producto.idProducto}" /></td>
                            <td><c:out value="${producto.descripcion}" /></td>
                            <td><c:out value="${producto.resumida}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.idUnidadMedida}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.idClasificacion}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.porcentajeImpuesto1}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.porcentajeImpuesto2}" /></td>
                            <td><c:out value="${producto.precioCosto}" /></td>
                            <td><c:out value="${producto.precioVenta}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.stockMinimo}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.stock}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.observacion}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.fechaRegistro}" /></td>
                            <td class="ocultar-columna"><c:out value="${producto.idUsuario}" /></td>
                            <td><c:out value="${producto.activo}" /></td>
                            <td><c:out value="${producto.unidadMedida}" /></td>
                            <td><c:out value="${producto.clasificacion}" /></td>
                            <td>
                                <a href="producto?action=actualizar&id=${producto.idProducto}">  
                                    <img style="width: 20px; height: 20px;" src="images/boton-editar.png" alt="Editar"/> 
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="footer-bar">
            <span id="date"></span>
            <span id="time"></span>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
