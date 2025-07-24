package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CambiarClave extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer cod = (Integer) session.getAttribute("codigo");

        String clave2 = request.getParameter("clave2");
        String repetirclave2 = request.getParameter("repetirclave2");

        if (!clave2.equals(repetirclave2)) {
            session.setAttribute("mensaje", "Claves no coinciden");
            response.sendRedirect("CambiarClave.jsp");
            return;
        }

        AccesoBD con = AccesoBD.getInstance();

        boolean exito = con.actualizarClave(cod, clave2);

        if (exito) {
            session.setAttribute("mensaje", "Clave actualizada correctamente");
            response.sendRedirect("Usuario2.jsp");
        }
    }
}