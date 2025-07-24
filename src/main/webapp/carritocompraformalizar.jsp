<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, tienda.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="Pagina web compra y venta">
    <meta name="keywords" content="WEB, HTML, HEAD">
    <meta name="description" content="cabecera">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buylatro</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/ico" href="img/icono.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <mi-menu></mi-menu>
    <div class="carrito">
        <%
            Integer cod = (Integer) session.getAttribute("codigo");

            if (cod == null || cod <= 0) {
                response.sendRedirect("logintienda.jsp");
                return; // Redirige si no hay una sesión activa
            }

            AccesoBD con = AccesoBD.getInstance();
            UsuarioBD usuario = con.obtenerUsuarioBD(cod);

            ArrayList<Producto> carritoJSON = (ArrayList<Producto>) session.getAttribute("carritoJSON");
        %>

        <h1>Carrito de Compras</h1>

        <%
            if (carritoJSON == null || carritoJSON.isEmpty()) {
        %>
            </br>
            <h2 style="color: red; text-align: center; ">Ningun producto que has seleccionado sigue disponible, lo sentimos.</h2>
            <div class="infousuariocambioAbajo">
                <a href="index.jsp" class="abutton">Continuar</a>
            </div>

        <%
            } else {
                float precioTotal = 0; // Variable para calcular el precio total
        %>
            <table id="tabla-carrito2" class="table table-striped">
                <thead>
                    <tr>
                        <th>Imagen</th>
                        <th>Descripción</th>
                        <th>Unidades</th>
                        <th>Precio Unitario</th>
                        <th>Precio Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Producto producto : carritoJSON) {
                            float precioProducto = producto.getCantidad() * producto.getPrecio();
                            precioTotal += precioProducto; // Sumar al precio total
                    %>
                    <tr>
                        <td><img src="<%= producto.getImagen() %>" alt="<%= producto.getDescripcion() %>" width="50"></td>
                        <td><%= producto.getDescripcion() %></td>
                        <td><%= producto.getCantidad() %></td>
                        <td><%= producto.getPrecio() %> €</td>
                        <td><%= precioProducto %> €</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><strong>Precio Total:</strong></td>
                        <td style="font-weight: bold;"><%= precioTotal %> €</td>
                    </tr>
                </tfoot>
            </table>

            </br>
            <h2 style="color: green;">Dirección de Envío</h2>

            <form name="form-envio" method="post" action="Tramitacion.html">
                <div class="form-envio1">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombreCompleto() %>" readonly>
                </div>
            
                <div class="form-envio1">
                    <label for="domicilio">Domicilio:</label>
                    <input type="text" id="domicilio" name="domicilio" value="<%= usuario.getDomicilio() %>" required>
                </div>
            
                <div class="form-envio1">
                    <label for="poblacion">Población:</label>
                    <input type="text" id="poblacion" name="poblacion" value="<%= usuario.getPoblacion() %>" required>
                </div>
            
                <div class="form-envio1">
                    <label for="provincia">Provincia:</label>
                    <input type="text" id="provincia" name="provincia" value="<%= usuario.getProvincia() %>" required>
                </div>
            
                <div class="form-envio1">
                    <label for="codigoPostal">Código Postal:</label>
                    <input type="text" id="codigoPostal" name="codigoPostal" value="<%= usuario.getCp() %>" required>
                </div>
                            </br>
                <h2 style="color: green;">Método de pago</h2>

                <div class="form-envio1">
                    <label for="transferencia">Transferencia Bancaria a: 1234 1234 1234 1234 1234</label>
                    <input type="radio" name="metodoPago" value="transferencia" required>

                    <label for="bizum">Bizum a: 640155410</label>
                    <input type="radio" name="metodoPago" value="bizum" required>

                    <label for="contrareembolso">Contrareembolso</label>
                    <input type="radio" name="metodoPago" value="contrareembolso" required>
                </div>
                
                </br>

                <div class="infousuariocambioAbajo">
                    <a href="carritocompra.jsp" class="abutton">Cancelar compra</a>
                    <button id="comprar" class="abutton" type="submit">Formalizar tu compra</button>
                </div>
            </form>
        <%
            }
        %>
    </div>

    <mi-footer></mi-footer>

    <script src="js/carrito.js" async defer></script>
    <script src="js/mis-etiquetas.js" async defer></script>
</body>
</html>