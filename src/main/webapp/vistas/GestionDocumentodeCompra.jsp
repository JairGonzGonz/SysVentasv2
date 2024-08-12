<%-- 
    Document   : Gestion Documento de Compra
    Created on : 2 jul 2024, 23:05:21
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="../css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="../css/GestionClientes.css" rel="stylesheet" type="text/css"/>
        <title>Gestión de Documento de Compra</title>
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
        <div class="documento">
            <h2>Gestion de Documento de Compra</h2>
            <div class="buscar">
                <div class="row">
                    <div class="col-md-4">
                        <label for="Proveedor">Proveedor:</label>
                        <input type="text" class="form-control" placeholder="Nombre o Codigo de Proveedor" aria-label="Proveedor">
                    </div>
                    <div class="col">
                        <label for="Fechainicio">Fecha de Inicio:</label>
                        <input type="date" class="form-control" placeholder="" aria-label="Fechainicio">
                    </div>
                    <div class="col">
                        <label for="Fechaenvio">Fecha de Envío:</label>
                        <input type="date" class="form-control" placeholder="" aria-label="Fechaenvio">
                    </div>
                    <div class="col">
                        <label for="Estadoenvio">Estado de Envío:</label>
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <br>
                    <div class="col">
                        <br>
                        <button type="button" class="btn btn-primary">  Buscar  </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="documento">
            <h2 class="float-start">Listado de Documento de Compra</h2>
            <button type="button" class="btn btn-primary float-end">Nueva orden de Compra</button>
            <table class="table table-bordered ">
                <thead>
                    <tr>
                        <th scope="col">Nro de Documento</th>
                        <th scope="col">   Proveedor</th>
                        <th scope="col">Fecha y hora</th>
                        <th scope="col">Responsable</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Almacen</th>
                        <th scope="col">Importe</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">0001</th>
                        <td>Hermanos Romero SAC</td>
                        <td>02/07/2024<br> 11:17am</td>
                        <td>Almacenero</td>
                        <td></td>
                        <td></td>
                        <td>10.00</td>
                        <td>                            
                            <button class="edit-button">✏️</button>
                            <button class="delete-button">🗑️</button>
<!--                            <button class="boton-con-imagen" onclick="alert('Editar')">
                                <img src="images/edit.png" alt="Descripción de la imagen" width="20" height="20">
                            </button>
                            <button class="boton-con-imagen" onclick="alert('Agregar')">
                                <img src="images/agregar.png" alt="Descripción de la imagen" width="20" height="20">
                            </button>
                            <button class="boton-con-imagen" onclick="alert('Eliminar')">
                                <img src="images/eliminar.png" alt="Descripción de la imagen" width="20" height="20">
                            </button>-->
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <th scope="row">0001</th>
                        <td>Angel Carmona</td>
                        <td>06/06/2024<br> 13:46am</td>
                        <td>Almacenero</td>
                        <td></td>
                        <td></td>
                        <td>15.00</td>
                        <td>
                            <button class="edit-button">✏️</button>
                            <button class="delete-button">🗑️</button>
<!--                            <button class="boton-con-imagen" onclick="alert('Editar')">
                                <img src="images/edit.png" alt="Descripción de la imagen" width="20" height="20">
                            </button>
                            <button class="boton-con-imagen" onclick="alert('Agregar')">
                                <img src="images/agregar.png" alt="Descripción de la imagen" width="20" height="20">
                            </button>
                            <button class="boton-con-imagen" onclick="alert('Eliminar')">
                                <img src="images/eliminar.png" alt="Descripción de la imagen" width="20" height="20">
                            </button>-->
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div class="btn-group float-end" role="group" aria-label="Basic outlined example">
                <button type="button" class="btn btn-outline-secondary">Anterior</button>
                <button type="button" class="btn btn-outline-secondary">1</button>
                <button type="button" class="btn btn-outline-secondary">Siguiente</button>
            </div>

        </div> 
        <div class="footer-bar">
            <span id="date"></span>
            <span id="time"></span>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
