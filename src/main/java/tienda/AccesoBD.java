package tienda;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public final class AccesoBD {
	private static AccesoBD instanciaUnica = null;
	private Connection conexionBD = null;

	public static AccesoBD getInstance(){
		if (instanciaUnica == null){
			instanciaUnica = new AccesoBD();
		}
		return instanciaUnica;
	}

	private AccesoBD() {
		abrirConexionBD();
	}

	public void abrirConexionBD() {
		if (conexionBD == null)
		{
			String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
			String DB_URL = "jdbc:mariadb://localhost:3306/proh";
			String USER = "root";
			String PASS = "Wna261020";
			try {
				Class.forName(JDBC_DRIVER);
				conexionBD = DriverManager.getConnection(DB_URL,USER,PASS);
			}
			catch(Exception e) {
				System.err.println("No se ha podido conectar a la base de datos");
				System.err.println(e.getMessage());
                e.printStackTrace();
			}
		}
	}

	public boolean comprobarAcceso() {
		abrirConexionBD();
		return (conexionBD != null);
	}

	public List<ProductoBD> obtenerProductosBD(int categoria) {
	abrirConexionBD();
	ArrayList<ProductoBD> productos = new ArrayList<>();

	try {
		String query = "SELECT codigo,descripcion,precio,existencias,imagen,categoria FROM productos WHERE categoria=?";
		PreparedStatement s = conexionBD.prepareStatement(query);
		s.setInt(1,categoria);
		ResultSet resultado = s.executeQuery();
		while(resultado.next()){
			ProductoBD producto = new ProductoBD();
			producto.setCodigo(resultado.getInt("codigo"));
			producto.setDescripcion(resultado.getString("descripcion"));
			producto.setPrecio(resultado.getFloat("precio"));
			producto.setStock(resultado.getInt("existencias"));
			producto.setImagen(resultado.getString("imagen"));
			producto.setCategoria(resultado.getInt("categoria"));
			productos.add(producto);
		}
	} catch(Exception e) {
		System.err.println("Error ejecutando la consulta a la base de datos");
		System.err.println(e.getMessage());
	}
	return productos;
	}



	public int comprobarUsuarioBD(String usuario, String clave) {
		abrirConexionBD();
	
		int codigo = -1;
	
		try {
			String consulta = "SELECT codigo FROM usuarios WHERE usuario = ? AND clave = ?";
			PreparedStatement s = conexionBD.prepareStatement(consulta);
			s.setString(1, usuario);
			s.setString(2, clave);
	
			ResultSet resultado = s.executeQuery();
	
			if (resultado.next()) {
				codigo = resultado.getInt("codigo");
			}
		} catch (Exception e) {
			System.err.println("Error verificando usuario/clave");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}	
		return codigo;
	}

	public UsuarioBD obtenerUsuarioBD(int codigo) {
		abrirConexionBD();
	
		UsuarioBD usuario = null;
	
		try {
			String query = "SELECT codigo, usuario, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono FROM usuarios WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, codigo);
			ResultSet resultado = s.executeQuery();
	
			if (resultado.next()) {
				usuario = new UsuarioBD();
				usuario.setCodigo(resultado.getInt("codigo"));
				usuario.setUsuario(resultado.getString("usuario"));
				usuario.setNombre(resultado.getString("nombre"));
				usuario.setApellidos(resultado.getString("apellidos"));
				usuario.setDomicilio(resultado.getString("domicilio"));
				usuario.setPoblacion(resultado.getString("poblacion"));
				usuario.setProvincia(resultado.getString("provincia"));
				usuario.setCp(resultado.getString("cp"));
				usuario.setTelefono(resultado.getString("telefono"));
			}
		} catch (Exception e) {
			System.err.println("no se ha podido obtener el usuario");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	
		return usuario;
	}


	public boolean usuarioExiste(String usuario) {
		abrirConexionBD();
		boolean existe = false;
	
		try {
			String query = "SELECT COUNT(*) FROM usuarios WHERE usuario = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setString(1, usuario);
	
			ResultSet resultado = s.executeQuery();
			if (resultado.next()) {
				existe = resultado.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return existe;
	}

	public boolean usuarioActivo(int codigo){
		abrirConexionBD();
		boolean activo = false;
		try {
			String query = "SELECT activo FROM usuarios WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, codigo);
			ResultSet resultado = s.executeQuery();
	
			if (resultado.next()) {
				activo = resultado.getBoolean("activo");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return activo;
	}


	public int obtenerNumeroUsuarios() {
		abrirConexionBD();
		int total = 0;
	
		try {
			String query = "SELECT COUNT(*) FROM usuarios";
			PreparedStatement s = conexionBD.prepareStatement(query);
			ResultSet resultado = s.executeQuery();

			if (resultado.next()) {
				total = resultado.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}


	public boolean registrarUsuario(int codigo, String usuario, String clave, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp, String telefono) {
        abrirConexionBD();
        boolean a = false;
    
        try {
            String query = "INSERT INTO usuarios (codigo, usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement s = conexionBD.prepareStatement(query);
            s.setInt(1, codigo);
            s.setString(2, usuario);
            s.setString(3, clave);
            s.setString(4, nombre);
            s.setString(5, apellidos);
            s.setString(6, domicilio);
            s.setString(7, poblacion);
            s.setString(8, provincia);
            s.setString(9, cp);
            s.setString(10, telefono);
    
            a = s.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("No se pudo registrar el usuario");
			System.err.println(e.getMessage());
            e.printStackTrace();
        }
    
        return a;
    }







	public boolean ExistenciasBD(int codigo, int cantidad) {
		abrirConexionBD();
		boolean quedan = false;
	
		try {
			String query = "SELECT existencias FROM productos WHERE id = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, codigo);
	
			ResultSet resultado = s.executeQuery();
			if (resultado.next()) {
				int existencias = resultado.getInt("existencias");
				quedan = existencias >= cantidad;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return quedan;
	}








	public boolean actualizarUsuarioBD(int codigo, String nombre, String apellido, String domicilio, String poblacion, String cp, String telefono) {
		abrirConexionBD();
		boolean exito = false;
	
		try {
			String query = "UPDATE usuarios SET nombre = ?, apellidos = ?, domicilio = ?, poblacion = ?, cp = ?, telefono = ? WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setString(1, nombre);
			s.setString(2, apellido);
			s.setString(3, domicilio);
			s.setString(4, poblacion);
			s.setString(5, cp);
			s.setString(6, telefono);
			s.setInt(7, codigo);
	
			exito = s.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exito;
	}

	public boolean actualizarClave(int codigo, String clave2) {
		abrirConexionBD();
		boolean exito = false;
	
		try {
			String query = "UPDATE usuarios SET clave = ? WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setString(1, clave2);
			s.setInt(2, codigo);
	
			exito = s.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return exito;
	}

	public int obtenerExistencias(int codigo) {
		abrirConexionBD();
		int existencias = 0;
	
		try {
			String query = "SELECT existencias FROM productos WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, codigo);
	
			ResultSet resultado = s.executeQuery();
			if (resultado.next()) {
				existencias = resultado.getInt("existencias");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return existencias;
	}




	public int obtenerNumeroPedidos() {
		abrirConexionBD();
		int pedidos = 0;
	
		try {
			String query = "SELECT COUNT(*) FROM pedidos";
			PreparedStatement s = conexionBD.prepareStatement(query);
			ResultSet resultado = s.executeQuery();
	
			if (resultado.next()) {
				pedidos = resultado.getInt(1);
			}
		} catch (Exception e) {
			System.err.println("Error al obtener el número de pedidos");
			e.printStackTrace();
		}
		return pedidos;
	}

	public int crearPedido(int cod, float importe) throws Exception {
		abrirConexionBD();
		int codpedido = obtenerNumeroPedidos() + 1;
	
		try {
			String query = "INSERT INTO pedidos (codigo, persona, fecha, importe, estado) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, codpedido);
			s.setInt(2, cod);
	
			java.sql.Date fechaActual = new java.sql.Date(System.currentTimeMillis());
			s.setDate(3, fechaActual);
	
			s.setFloat(4, importe);
			s.setInt(5, 1);
	
			s.executeUpdate();
	
		} catch (Exception e) {
			System.err.println("Error al crear el pedido");
			e.printStackTrace();
		}
		return codpedido;
	}



    public void insertarDetallesPedido(int codpedido, ArrayList<Producto> carritoJSON) throws Exception {
        abrirConexionBD();

        try {
            String query = "INSERT INTO detalle (codigo_pedido, codigo_producto, unidades, precio_unitario) VALUES (?, ?, ?, ?)";
            PreparedStatement s = conexionBD.prepareStatement(query);

            for (Producto producto : carritoJSON) {
                s.setInt(1, codpedido);
                s.setInt(2, producto.getCodigo());
                s.setInt(3, producto.getCantidad());
                s.setFloat(4, producto.getPrecio());
                s.addBatch();
            }
            s.executeBatch();
        } catch (Exception e) {
			e.printStackTrace();
		}
    }

	
	public ArrayList<Pedido> pedidousuario(int cod) {
		abrirConexionBD();
		ArrayList<Pedido> pedidos = new ArrayList<>();
	
		try {
			String query = "SELECT codigo, fecha, importe, estado FROM pedidos WHERE persona = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, cod);
			ResultSet resultado = s.executeQuery();
	
			while (resultado.next()) {
				int id = resultado.getInt("codigo");
				String fecha = resultado.getString("fecha");
				float importe = resultado.getFloat("importe");
				String estado = resultado.getString("estado");
	
				Pedido pedido = new Pedido(id, fecha, importe, estado);
	
				pedidos.add(pedido);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pedidos;
	}


	public ArrayList<DetallePedido> obtenerDetalles(int codigoPedido) {
		abrirConexionBD();
		ArrayList<DetallePedido> detalles = new ArrayList<>();
	
		try {
			String query = "SELECT codigo_producto, unidades, precio_unitario FROM detalle WHERE codigo_pedido = ?";
			PreparedStatement sdetalles = conexionBD.prepareStatement(query);
			sdetalles.setInt(1, codigoPedido);
			ResultSet resultadodetalles = sdetalles.executeQuery();
	
			while (resultadodetalles.next()) {
				int codigoProducto = resultadodetalles.getInt("codigo_producto");
				int unidades = resultadodetalles.getInt("unidades");
				float precioUnitario = resultadodetalles.getFloat("precio_unitario");
	
				DetallePedido detalle = new DetallePedido(codigoProducto, unidades, precioUnitario);
	
				detalles.add(detalle);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return detalles;
	}


	public void cancelarPedido(int idPedido) {
		abrirConexionBD();
	
		try {
			String query = "UPDATE pedidos SET estado = 4 WHERE codigo = ?";
			PreparedStatement s = conexionBD.prepareStatement(query);
			s.setInt(1, idPedido);
			s.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}