package tienda;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProcesarPedido extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(true);
        if (sesion.getAttribute("carritoJSON") != null) {
            sesion.removeAttribute("carritoJSON");
        }

        ArrayList<Producto> carritoJSON = new ArrayList<>();
        AccesoBD con = AccesoBD.getInstance();

        JsonReader jsonReader = Json.createReader(new InputStreamReader(request.getInputStream(), "utf-8"));
        JsonArray jobj = jsonReader.readArray();

        for (int i = 0; i < jobj.size(); i++) {
            JsonObject prod = jobj.getJsonObject(i);
            Producto nuevo = new Producto();

            nuevo.setCodigo(prod.getInt("codigo"));
            nuevo.setDescripcion(prod.getString("descripcion"));
            nuevo.setImagen(prod.getString("imagen"));
            nuevo.setPrecio(Float.parseFloat(prod.get("precio").toString()));

            int cantidad = prod.getInt("cantidad");
            int existencias = con.obtenerExistencias(nuevo.getCodigo());

            if (cantidad > existencias) {
                cantidad = existencias;
            }
            if (cantidad > 0) {
                nuevo.setCantidad(cantidad);
                carritoJSON.add(nuevo);
            }
        }

        if (carritoJSON.size() > 0) {
            sesion.setAttribute("carritoJSON", carritoJSON);
        }

        RequestDispatcher rd = request.getRequestDispatcher("carritocompraformalizar.jsp");
        rd.forward(request, response);
    }
}