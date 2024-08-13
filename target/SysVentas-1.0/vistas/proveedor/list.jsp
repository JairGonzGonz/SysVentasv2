<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lista de Proveedores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body class="bg-light">
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
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a style="margin-left: 10px; border:none" class="btn btn-outline-dark dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" href="#">Tablas</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="producto?action=listar">Gestion de Productos</a></li>
                                <li><a class="dropdown-item" href="cliente?action=listar">Gestion de Clientes</a></li>
                                <li><a class="dropdown-item" href="proveedor?action=list">Gestion de Proveedores</a></li>     
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
                        <li><a class="dropdown-item" href="vistas/logout.jsp">Salir</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid py-4">
            <h1 class="mb-4 text-center">Lista de Proveedores</h1>

            <div class="row mb-3">
                <div class="col">
                    <a href="<c:url value='/proveedor/new'/>" class="btn btn-success">
                        <i class="bi bi-plus-circle me-2"></i>Agregar Nuevo Proveedor
                    </a>
                </div>
            </div>

            <div class="card shadow">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>RUC</th>
                                    <th>Razón Social</th>
                                    <th>Razón Comercial</th>
                                    <th>Correo</th>
                                    <th>Teléfono</th>
                                    <th>Días Crédito</th>
                                    <th>Contacto 1</th>
                                    <th>Teléfono C1</th>
                                    <th>Contacto 2</th>
                                    <th>Teléfono C2</th>
                                    <!--? <th>Fecha Registro</th>-->
                                    <th>ID Usuario</th>
                                    <th>ID Ubigeo</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="proveedor" items="${proveedores}">
                                    <tr>
                                        <td><c:out value="${proveedor.RUCProveedor}" /></td>
                                        <td><c:out value="${proveedor.razonSocial}" /></td>
                                        <td><c:out value="${proveedor.razonComercial}" /></td>
                                        <td><c:out value="${proveedor.correo}" /></td>
                                        <td><c:out value="${proveedor.telefono}" /></td>
                                        <td><c:out value="${proveedor.diasCredito}" /></td>
                                        <td><c:out value="${proveedor.contacto1}" /></td>
                                        <td><c:out value="${proveedor.telefonoC1}" /></td>
                                        <td><c:out value="${proveedor.contacto2}" /></td>
                                        <td><c:out value="${proveedor.telefonoC2}" /></td>

                                        <td><c:out value="${proveedor.IDUsuario}" /></td>
                                        <td><c:out value="${proveedor.IDUbigeo}" /></td>
                                        <td>
                                            <a href="<c:url value='/proveedor/edit?rucProveedor=${proveedor.RUCProveedor}'/>" class="btn btn-primary btn-sm">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <a href="<c:url value='/proveedor/delete?rucProveedor=${proveedor.RUCProveedor}'/>" class="btn btn-danger btn-sm" 
                                               onclick="return confirm('¿Está seguro de que desea eliminar este proveedor?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>