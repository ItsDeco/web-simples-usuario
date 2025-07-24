<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>

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
    <cabecera-tienda></cabecera-tienda>

    <div class="tienda-grid-wrap">
        <h2>Vales</h2>
        <div class="tienda-grid">
            <%
                int categoria = 2;
                AccesoBD con = AccesoBD.getInstance();
                List<ProductoBD> productos = con.obtenerProductosBD(categoria);

                for (ProductoBD producto : productos) {
                    int codigo = producto.getCodigo();
                    String descripcion = producto.getDescripcion();
                    float precio = producto.getPrecio();
                    int existencias = producto.getStock();
                    String imagen = producto.getImagen();
            %>
            <div class="tienda-item">
                <img src="<%=imagen%>" alt="<%=descripcion%>">
                <div class="item-info">
                    <h3><%=descripcion%></h3>
                    <p>Precio del producto: <%=precio%>€</p>
                    <% if (existencias > 0) { %>
                        <button class="comprar" onclick="agregarAlCarrito(<%=codigo%>, '<%=descripcion%>', '<%=imagen%>', <%=precio%>, <%=existencias%>)">Añadir al carrito</button>
                    <% } else { %>
                        &nbsp;
                    <% } %>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <mi-footer></mi-footer>
    <script src="js/mis-etiquetas.js" async defer></script>
    <script src="js/carrito.js" async defer></script>
</body>

</html>