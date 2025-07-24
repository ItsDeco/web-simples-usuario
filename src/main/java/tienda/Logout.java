package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        String url = request.getParameter("url");
        response.sendRedirect("logintienda.jsp?from=" + ("Usuario2.jsp".equals(url) ? "menu" : "carrito")); //para poder saber hacia donde tiene que ir (osea hacia cual "logintienda" hay que ir)
    }
}