package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CancelarPedido extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codigo = request.getParameter("idPedido");

        if (codigo != null) {
            try {
                int idPedido = Integer.parseInt(codigo);
                AccesoBD con = AccesoBD.getInstance();
                con.cancelarPedido(idPedido);

                response.sendRedirect("GestionarPedidos.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("GestionarPedidos.jsp");
        }
    }
}