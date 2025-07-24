package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegistroUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String repiteClave = request.getParameter("repiteClave");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String domicilio = request.getParameter("domicilio");
        String poblacion = request.getParameter("poblacion");
        String provincia = request.getParameter("provincia");
        String cp = request.getParameter("cp");
        String telefono = request.getParameter("telefono");

        HttpSession session = request.getSession();

        if (!clave.equals(repiteClave)) {
            session.setAttribute("mensaje", "Las claves no coinciden.");
            request.getRequestDispatcher("Usuario3.jsp").forward(request, response);
            return;
        }

        AccesoBD con = AccesoBD.getInstance();

        if (con.usuarioExiste(usuario)) {
            session.setAttribute("mensaje", "El usuario ya existe.");
            request.getRequestDispatcher("Usuario3.jsp").forward(request, response);
            return;
        }

        int cdigo = con.obtenerNumeroUsuarios() + 1;

        boolean exito = con.registrarUsuario(cdigo, usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono);

        if (exito) {
            session.invalidate();
            response.sendRedirect("logintienda.jsp?from=menu");
        } else {
            session.setAttribute("mensaje", "Has cometido algun error revisa el formulario (CP (5) y Telefono (9) solo aceptan numeros)");
            request.getRequestDispatcher("Usuario3.jsp").forward(request, response);
        }
    }
}