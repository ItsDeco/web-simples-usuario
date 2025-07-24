<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="tienda.*" %>
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
    <div class="pedidos">
        <%
        Integer cod = (Integer) session.getAttribute("codigo");

        if (cod == null || cod <= 0) {
            response.sendRedirect("logintienda.jsp");
            return;
        }

        AccesoBD accesoBD = AccesoBD.getInstance();
        ArrayList<Pedido> pedidos = accesoBD.pedidousuario(cod);
        %>
        <h1>Mis Pedidos</h1>
        <table class="table-striped">
            <thead>
                <tr>
                    <th>Código Pedido</th>
                    <th>Fecha</th>
                    <th>Importe Total</th>
                    <th>Estado</th>
                    <th>Código Producto</th>
                    <th>Unidades</th>
                    <th>Precio Unitario</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (pedidos != null && !pedidos.isEmpty()) {
                    for (Pedido pedido : pedidos) {
                        ArrayList<DetallePedido> detalles = accesoBD.obtenerDetalles(pedido.getId());
                        for (DetallePedido detalle : detalles) {
                %>
                <tr>
                    <td><%= pedido.getId() %></td>
                    <td><%= pedido.getFecha() %></td>
                    <td><%= pedido.getImporteTotal() %> €</td>
                    <td>
                        <%= pedido.getEstado() %>
                        <% if (pedido.getEstado().equals("1")) { %>
                            <form action="CancelarPedido.html" method="post">
                                <input type="hidden" name="idPedido" value="<%= pedido.getId() %>" />
                                <button type="submit" class="btn abutton">Cancelar</button>
                            </form>
                        <% } %>
                    </td>
                    <td><%= detalle.getCodigoProducto() %></td>
                    <td><%= detalle.getUnidades() %></td>
                    <td><%= detalle.getPrecioUnitario() %> €</td>
                </tr>
                <%
                        }
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">No se encontraron pedidos.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <div class="infousuariocambioAbajo">
            <a href="Usuario2.jsp" class="abutton">Volver</a>
        </div>
    </div>

    <script src = "js/mis-etiquetas.js" async defer></script>
    <mi-footer></mi-footer>
</body>

</html>