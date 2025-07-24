<%@ page language="java" contentType="text/html; charset=UTF-8" import="tienda.*" pageEncoding="UTF-8" %>
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
    <mi-menu></mi-menu>

    <div class="usuario">
        <h1>Acceso</h1>

        <%
        String mensaje = (String)session.getAttribute("mensaje");

        if (mensaje != null) {
        %>
            <%
                session.removeAttribute("mensaje");
            %>
            <h2> <%=mensaje%> </h2>
            <%
        }
        %>
        
        <%
        String from = request.getParameter("from");
        
        if ((session.getAttribute("codigo") == null) ||
            ((Integer)session.getAttribute("codigo") <=0 ))
        {
        %>
        <form method="post" action="logintienda.html">
            <label for="usuario">Usuario: </label>
            <input id="usuario" autofocus="autofocus" required="required" type="text" name="usuario" size="50"
                placeholder="Pon aquí tu usuario" />

            <br/>

            <label for="clave">Contraseña: </label>
            <input id="clave" required="required" type="password" name="clave" size="50" placeholder="Pon aquí tu contraseña" />

            <br/>
            
            <input type="hidden" name="url" value="<%= "menu".equals(request.getParameter("from")) ? "Usuario2.jsp" : "logintienda.jsp" %>" />

            <div class="infousuariocambioAbajo">
                <br /><br />
                <input type="submit" class="abutton" value="Entrar" />
            </div>
        </form>
        <%
        } else {
            if ("menu".equals(from)) {
                response.sendRedirect("Usuario2.jsp");
            } else {
                response.sendRedirect("carritocompra.jsp");
            }
        }
        %>
        </div>

    <mi-footer class="fixed-bottom"></mi-footer>

    <script src="js/mis-etiquetas.js" async defer></script>
</body>

</html>