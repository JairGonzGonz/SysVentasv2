<%-- 
    Document   : PagoDocumentoCompra
    Author     : David
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="../css/principal.css" rel="stylesheet" type="text/css"/>
        <title>Pago de documento de Compra</title>
        <script src="../JS/UpdateTime.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <!--<a class="navbar-brand" href="#">Logo</a>-->
                <img class="navbar-brand" src="../images/logo.png" height="60px" width="60px" href="#" alt=""/>
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
                                <li><a class="dropdown-item" href="#">Gestion de Productos</a></li>
                                <li><a class="dropdown-item" href="GestiondeClientes.jsp">Gestion de Clientes</a></li>
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
                       
                        <img src="../images/user.png" alt=""/>
                    </button>
                    <ul class="dropdown-menu ">
                        <li><a class="dropdown-item" href="#">

                            </a>
                        </li>
                        <li><a class="dropdown-item" href="#">Usuario <%= session.getAttribute("username") %></a></li>                        
                        <li><a class="dropdown-item" href="#">Usuario@gmail.com</a></li>
                        <div class="dropdown-divider"></div>
                        <li><a class="dropdown-item" href="logout.jsp">Salir</a></li>
                     
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h2 class="text-center">Pago de documento de Compra</h2>
            <form action="tuServletDeGestion" method="POST">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="IDComprobante">Nro. de comprobante de pago:</label>
                            <input type="text" class="form-control" id="IDComprobante" name="IDComprobante" placeholder="N° Comprobante">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="IDNumDoc">Numero de Documento:</label>
                            <input type="text" class="form-control" id="IDNumDoc" name="IDNumDoc" placeholder="Documento" readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inProveedor">Proveedor:</label>
                            <input type="text" class="form-control" id="inProveedor" name="inProveedor" placeholder="Razon Social" readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inRuc">RUC:</label>
                            <input type="text" class="form-control" id="inRuc" name="inRuc" placeholder="R.U.C." readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="numPago">Monto a Pagar:</label>
                            <input type="number" id="numPago" name="numPago" class="form-control" placeholder="1.00" step="0.50" min="0" max="9999999.00" style="text-align:right;" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inEmail">Correo (Em@il):</label>
                            <input type="email" class="form-control" id="inEmail" name="inEmail" placeholder="Correo Electronico">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="datFecha">Fecha de pago:</label>
                            <input type="date" class="form-control" id="datFecha" name="datFecha">
                        </div>
                    </div>
                </div>
                <hr>
                <button type="submit" class="btn btn-primary btn-block">Pagar</button>
                <button class="btn btn-primary btn-block">Salir</button>
            </form>
        </div>
        <div class="footer-bar">
            <span id="date"></span>
            <span id="time"></span>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
