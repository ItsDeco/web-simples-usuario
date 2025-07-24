package tienda;

public class DetallePedido {
    private int codigoProducto;
    private int unidades;
    private float precioUnitario;

    public DetallePedido(int codigoProducto, int unidades, float precioUnitario) {
        this.codigoProducto = codigoProducto;
        this.unidades = unidades;
        this.precioUnitario = precioUnitario;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public int getUnidades() {
        return unidades;
    }

    public float getPrecioUnitario() {
        return precioUnitario;
    }
}