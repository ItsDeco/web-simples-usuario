package tienda;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GestionarPedidos extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer cod = (Integer) session.getAttribute("codigo");
        AccesoBD con = AccesoBD.getInstance();
        ArrayList<Pedido> pedidos = con.pedidousuario(cod);

        request.setAttribute("pedidos", pedidos);
        request.getRequestDispatcher("GestionarPedidos.jsp").forward(request, response);
    }
}