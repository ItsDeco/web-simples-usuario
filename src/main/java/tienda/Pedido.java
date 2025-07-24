package tienda;

public class Pedido {
    private int id;
    private String fecha;
    private float importeTotal;
    private String estado;

    public Pedido(int id, String fecha, float importeTotal, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.importeTotal = importeTotal;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public String getFecha() {
        return fecha;
    }

    public float getImporteTotal() {
        return importeTotal;
    }

    public String getEstado() {
        return estado;
    }
}