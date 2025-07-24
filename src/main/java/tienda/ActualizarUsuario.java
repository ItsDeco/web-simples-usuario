package tienda;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ActualizarUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer cod = (Integer) session.getAttribute("codigo");

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String domicilio = request.getParameter("domicilio");
        String poblacion = request.getParameter("poblacion");
        String cp = request.getParameter("cp");
        String telefono = request.getParameter("telefono");

        AccesoBD con = AccesoBD.getInstance();
        boolean exito = con.actualizarUsuarioBD(cod, nombre, apellido, domicilio, poblacion, cp, telefono);

        if (exito) {
            session.setAttribute("mensaje", "Datos actualizados");
            response.sendRedirect("Usuario2.jsp");
        } else {
            session.setAttribute("mensaje", "Has cometido algun error (CP (5) y Telefono (9) solo aceptan numeros)");
            response.sendRedirect("CambiarDatos.jsp");
        }
    }
}