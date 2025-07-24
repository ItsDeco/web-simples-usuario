<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, tienda.*" %>
<!DOCTYPE html>
<html lang = "es">


    <head>
        <meta charset = "UTF-8" />
        <meta name = "author" content = "Pagina web compra y venta" />
        <meta name = "keywords" content = "WEB, HTML, HEAD" />
        <meta name = "description" content = "cabecera"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Buylatro</title>
        <link rel="stylesheet" href = "css/styles.css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/ico" href="img/icono.png"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
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
            return; // redigire si no hay una session activa
        }

        AccesoBD con = AccesoBD.getInstance();
        UsuarioBD usuario = con.obtenerUsuarioBD(cod);
    %>
        <h1>Carrito de Compras</h1>

        <table id="tabla-carrito2">
            <tr>
                <th></th>
                <th>Descripción</th>
                <th>Unidades</th>
                <th>Precio</th>
            </tr>
        </table>

        <div class="infousuariocambioAbajo">
            <a href="Carrito.html" class="abutton">Continuar comprando</a>
            <button id="comprar" class="abutton" onclick="EnviarCarrito('ProcesarPedido.html', carrito)">Formalizar pedido</button>

            <form method="post" action="logout.html">
                <input type="hidden" name="url" value="carritocompra.html" />
                <button type="submit" class="abutton">Cerrar sesión</button>
            </form>
            
        </div>
    </div>
    <mi-footer></mi-footer>
    <script src = js/libson.js async defer></script>
    <script src="js/carrito.js" async defer></script>
    <script src="js/mis-etiquetas.js" async defer></script>
</body>
</html>