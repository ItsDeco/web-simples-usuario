<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tienda.UsuarioBD, tienda.AccesoBD" %>
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
    <div class="infousuariocambio">
        <h1>Cambiar Datos del Usuario</h1>
        <%
            String mensaje = (String) session.getAttribute("mensaje");

            if (mensaje != null) {
        %>
            <h2><%= mensaje %></h2>
        <%
                session.removeAttribute("mensaje");
            }
            
            Integer cod = (Integer) session.getAttribute("codigo");

            if (cod == null || cod <= 0) {
                response.sendRedirect("logintienda.jsp");
                return;
            }

            AccesoBD con = AccesoBD.getInstance();
            UsuarioBD usuario = con.obtenerUsuarioBD(cod);

         {
        %>
        <form method="post" action="actualizar.html">
            <div class="formcambio">
                <label for="usuario">Usuario</label>
                <input type="text" id="usuario" name="usuario" value="<%= usuario.getUsuario() %>" readonly>
            </div>
            <div class="formcambio">
                <label for="nombre">Nombre</label>
                <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombre() %>" required>
            </div>
            <div class="formcambio">
                <label for="apellido">Apellido</label>
                <input type="text" id="apellido" name="apellido" value="<%= usuario.getApellidos() %>" required>
            </div>
            <div class="formcambio">
                <label for="domicilio">Domicilio</label>
                <input type="text" id="domicilio" name="domicilio" value="<%= usuario.getDomicilio() %>" required>
            </div>
            <div class="formcambio">
                <label for="poblacion">Población</label>
                <input type="text" id="poblacion" name="poblacion" value="<%= usuario.getPoblacion() %>" required>
            </div>
            <div class="formcambio">
                <label for="cp">CP</label>
                <input type="text" id="cp" name="cp" value="<%= usuario.getCp() %>" required>
            </div>
            <div class="formcambio">
                <label for="telefono">Teléfono</label>
                <input type="text" id="telefono" name="telefono" value="<%= usuario.getTelefono() %>" required>
            </div>
            <div class="infousuariocambioAbajo">
                <button type="submit" class="btnguardar">Guardar Cambios</button>
                <a href="Usuario2.jsp" class="abutton">Cancelar</a>
            </div>
        </form>
        <%
            }
        %>
    </div>
    <mi-footer></mi-footer>
    <script src="js/mis-etiquetas.js" async defer></script>
</body>
</html>