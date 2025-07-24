package tienda;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Tramitacion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer cod = (Integer) session.getAttribute("codigo");
        ArrayList<Producto> carritoJSON = (ArrayList<Producto>) session.getAttribute("carritoJSON");

        if (cod == null || carritoJSON == null || carritoJSON.isEmpty()) {
            response.sendRedirect("carritocompraformalizar.jsp");
            return;
        }

        AccesoBD con = AccesoBD.getInstance();
        int codpedido = -1;

        try {
            float importe = 0;
            for (Producto producto : carritoJSON) {
                importe += producto.getCantidad() * producto.getPrecio();
            }

            int numPedidos = con.obtenerNumeroPedidos();
            codpedido = numPedidos + 1;
            con.crearPedido(cod, importe);
            con.insertarDetallesPedido(codpedido, carritoJSON);

            session.removeAttribute("carritoJSON");

            request.setAttribute("codigoPedido", codpedido); //antes estaba intentado redirecionar directamente desde aqui el numero de pedido a la pagina final, pero no me funcionaba
            request.getRequestDispatcher("pedidofinalizado.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("carritocompraformalizar.jsp");
        }
    }
}