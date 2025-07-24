<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="tienda.AccesoBD" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="author" content="Pagina web compra y venta" />
    <meta name="keywords" content="WEB, HTML, HEAD" />
    <meta name="description" content="cabecera" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buylatro</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" type="image/ico" href="img/icono.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <%
        Integer cod = (Integer) session.getAttribute("codigo");

        if (cod == null || cod <= 0) {
            response.sendRedirect("logintienda.jsp");
            return; // Redirige si no hay una sesión activa
        }

        AccesoBD con = AccesoBD.getInstance();
        int codigoPedido = con.obtenerNumeroPedidos();
    %>

    <mi-menu></mi-menu>
    <div class="pedidofinalizado">
        <h1>Pedido Finalizado</h1>
        <p>Su pedido ha sido procesado con éxito.</p>
        <p>Código de tu pedido: <strong><%= codigoPedido %></strong></p>
        <div class="infousuariocambioAbajo">
            <a href="index.jsp" class="abutton">Continuar</a>
        </div>
    </div>
    <mi-footer class="fixed-bottom"></mi-footer>
    <script src="js/mis-etiquetas.js" async defer></script>
</body>

</html>