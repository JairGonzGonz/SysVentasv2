<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Combo" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Producto</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="../css/principal.css" rel="stylesheet" type="text/css"/>
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
        <div class="container">
            <h1>Editar Producto</h1>
            <form action="producto?action=actualizar" method="post">
                <div class="form-group">
                    <label for="descripción:">Codigo:</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" value="<c:out value='${producto.idProducto}' />" disabled>
                </div>
                <div class="form-group">
                    <label for="descripción:">Descripción:</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" value="<c:out value='${producto.descripcion}' />" required>
                </div>
                <div class="form-group">
                    <label for="resumida">Resumida:</label>
                    <input type="text" class="form-control" id="resumida" name="resumida" value="<c:out value='${producto.resumida}' />" required>
                </div>
                <!-- Combo Unidad de Medida -->
                <div class="form-group">
                    <label for="unidadMedida">Unidad de Medida:</label>
                    <select id="unidadMedida" name="unidadMedida" class="form-control">
                        <!--<c:forEach items="${unidadesMedidas}" var="unidadmedida">
                            <option value="${unidadmedida[0]}">${unidadmedida[1]}</option>
                        </c:forEach>-->
                        <option value="1">Kilogramos</option>
                        <option value="2">Libras</option>
                        <option value="3">Toneladas Lasrgas</option>
                        <option value="4">Toneladas Metricas</option>
                        <option value="5">Toneladas Cortas</option>
                        <option value="6">Gramos</option>
                        <option value="7">Unidades</option>
                        <option value="8">Litros</option>
                        <option value="9">Galones</option>
                        <option value="10">Barriles</option>
                        <option value="11">Latas</option>
                        <option value="12">Cajas</option>
                        <option value="13">Millares</option>
                        <option value="14">Metros Cubicos</option>
                        <option value="15">Metros</option>
                        <option value="16">Mililitro</option>
                        <option value="17">Onza</option>
                    </select>
                </div>                
                <!-- Combo Clasificación -->
                <div class="form-group">
                    <label for="clasificacion">Clasificación:</label>
                    <select id="clasificacion" name="clasificacion" class="form-control">
                        <!--<c:forEach items="${clasificaciones}" var="clasificacion">
                            <option value="${clasificacion[0]}">${clasificacion[1]}</option>
                        </c:forEach>-->
                            <option value="1">Abarrotes</option>
                            <option value="2">Lacteos</option>
                            <option value="3">Frutas</option>
                            <option value="4">Verduras</option>
                            <option value="5">Tuberculos</option>
                            <option value="6">Vegetales</option>
                            <option value="7">Carnes</option>
                            <option value="8">Gaseosas</option>
                            <option value="9">Aguas</option>
                            <option value="10">Licores</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="impuesto1">Impuesto 1(%):</label>
                    <input type="number" step="0.05" class="form-control" id="impuesto1" name="impuesto1" value="<c:out value='${producto.porcentajeImpuesto1}' />" required>
                </div>
                <div class="form-group">
                    <label for="impuesto2">Impuesto 2(%):</label>
                    <input type="number" step="0.05" class="form-control" id="impuesto2" name="impuesto2" value="<c:out value='${producto.porcentajeImpuesto2}' />">
                </div>
                <div class="form-group">
                    <label for="precioCosto">Precio de Costo:</label>
                    <input type="number" step="0.05" class="form-control" id="precioCosto" name="precioCosto" value="<c:out value='${producto.precioCosto}' />" required>
                </div>
                <div class="form-group">
                    <label for="precioVenta">Precio de Venta:</label>
                    <input type="number" step="0.05" class="form-control" id="precioVenta" name="precioVenta" value="<c:out value='${producto.precioVenta}' />" required>
                </div>
                <div class="form-group">
                    <label for="stockMinimo">Stock Minimo:</label>
                    <input type="number" step="0.05" class="form-control" id="stockMinimo" name="stockMinimo" value="<c:out value='${producto.stockMinimo}' />" >
                </div>
                <div class="form-group">
                    <label for="stock">Stock:</label>
                    <input type="number" step="0.05" class="form-control" id="stock" name="stock" value="<c:out value='${producto.stock}' />" >
                </div>
                <div class="form-group">
                    <label for="Observacion">Observacion:</label>
                    <textarea name="Observacion" id="Observacion" class="form-control" maxlength="500" rows="10" >
                        <c:out value='${producto.observacion}' />
                    </textarea>
                </div>
                <div class="form-group">
                    <label for="fechaRegistro">Fecha de Registro:</label>
                    <input type="date" class="form-control" id="fechaRegistro" name="fechaRegistro" value="<c:out value='${producto.fechaRegistro}' />" required>
                </div>
                <div class="form-group">
                    <label for="idUsuario">ID Usuario:</label>
                    <input type="text" class="form-control" id="idUsuario" name="idUsuario" value="<c:out value='${producto.idUsuario}' />" required>
                </div>
                <div class="form-group">
                    <label for="Activo">Activo:</label>
                    <input type="checkbox" id="Activo" name="Activo" value="<c:out value='${producto.activo}' />" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Actualizar Producto</button>
                <a href="producto?action=listar" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>

        <div class="footer-bar">
            <span id="date"></span>
            <span id="time"></span>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
