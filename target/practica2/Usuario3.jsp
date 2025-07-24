<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, tienda.*" %>
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

    <div class="registro">
        <h1>Registro de Usuario</h1>

        <%
        String mensaje = (String) session.getAttribute("mensaje");

        if (mensaje != null) {
        %>
            <%
                session.removeAttribute("mensaje");
            %>
            <h2> <%= mensaje %> </h2>
            <%
        }
        %>

        <form method="post" action="registro.html">
            <label for="usuario">Usuario:</label>
            <input id="usuario" autofocus="autofocus" required="required" type="text" name="usuario" class="RegistroUsuario" placeholder="Pon aquí tu usuario" />

            <hr/>

            <label for="clave">Clave:</label>
            <input id="clave" required="required" type="password" name="clave" class="RegistroUsuario" placeholder="Pon aquí tu clave" />

            <hr/>

            <label for="repiteClave">Repite la Clave:</label>
            <input id="repiteClave" required="required" type="password" name="repiteClave" class="RegistroUsuario" placeholder="Repite tu clave" />

            <hr/>

            <label for="nombre">Nombre:</label>
            <input id="nombre" required="required" type="text" name="nombre" class="RegistroUsuario" placeholder="Pon aquí tu nombre" />

            <hr/>

            <label for="apellidos">Apellidos:</label>
            <input id="apellidos" required="required" type="text" name="apellidos" placeholder="Pon aquí tus apellidos" />

            <hr/>

            <label for="domicilio">Domicilio:</label>
            <input id="domicilio" required="required" type="text" name="domicilio" placeholder="Pon aquí tu domicilio" />

            <hr/>

            <label for="poblacion">Población:</label>
            <input id="poblacion" required="required" type="text" name="poblacion" placeholder="Pon aquí tu población" />

            <hr/>

            <label for="provincia">Provincia:</label>
            <input id="provincia" required="required" type="text" name="provincia" placeholder="Pon aquí tu provincia" />

            <hr/>

            <label for="cp">CP:</label>
            <input id="cp" required="required" type="text" name="cp" placeholder="Pon aquí tu código postal" />

            <hr/>

            <label for="telefono">Teléfono:</label>
            <input id="telefono" required="required" type="text" name="telefono" placeholder="Pon aquí tu teléfono" />

            <hr/>

            <div class="RegistroAbajo">
                <input type="submit" value="Registrar" class="botonEnviar2" />
            </div>
        </form>
    </div>

    <mi-footer></mi-footer>

    <script src="js/mis-etiquetas.js" async defer></script>
</body>

</html>