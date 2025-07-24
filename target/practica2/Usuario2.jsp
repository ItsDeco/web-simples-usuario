<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, tienda.*" pageEncoding="UTF-8" %>
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

    <div class="infousuario">
        <%
            String mensaje = (String) session.getAttribute("mensaje");

            if (mensaje != null) {
        %>
            <h3><%= mensaje %></h3>
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

        <h1>Información del Usuario</h1>

        <h2>Ingresado como: <%= usuario.getUsuario() %></h2>

        <table>
            <tr>
                <th>Nombre</th>
                <td><%= usuario.getNombre() %></td>
            </tr>
            <tr>
                <th>Apellido</th>
                <td><%= usuario.getApellidos() %></td>
            </tr>
            <tr>
                <th>Domicilio</th>
                <td><%= usuario.getDomicilio() %></td>
            </tr>
            <tr>
                <th>Población</th>
                <td><%= usuario.getProvincia() %></td>
            </tr>
            <tr>
                <th>CP</th>
                <td><%= usuario.getCp() %></td>
            </tr>
            <tr>
                <th>Teléfono</th>
                <td><%= usuario.getTelefono() %></td>
            </tr>
        </table>
        <div class="infousuarioAbajo">
            <a href="CambiarDatos.jsp"><button>Cambiar Datos</button></a>
            <a href = "CambiarClave.jsp"><button>Cambiar Clave</button></a>
            <a href="GestionarPedidos.jsp"><button>Gestionar Pedidos</button></a>
            <form method="post" action="logout.html">
                <input type="hidden" name="url" value="Usuario2.jsp" />
                <button type="submit">Cerrar Sesión</button>
            </form>
        </div>
        <%
            }
        %>
    </div>

    <mi-footer class="fixed-bottom"></mi-footer>

    <script src="js/mis-etiquetas.js" async defer></script>
</body>

</html>