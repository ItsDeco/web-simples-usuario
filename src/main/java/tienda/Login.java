package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String url = request.getParameter("url");

        HttpSession session = request.getSession(true);
        AccesoBD con = AccesoBD.getInstance();

        if ((usuario != null) && (clave != null)) {
            int codigo = con.comprobarUsuarioBD(usuario, clave);
            boolean activo = con.usuarioActivo(codigo);
            if (codigo > 0 && activo) {
                session.setAttribute("codigo", codigo);
                response.sendRedirect(url);
            } else {
                session.setAttribute("mensaje", "Usuario y/o clave incorrectos");
                response.sendRedirect("logintienda.jsp?from=" + ("Usuario2.jsp".equals(url) ? "menu" : "carrito"));
            }
        }
    }
}