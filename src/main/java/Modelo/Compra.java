package Modelo;

public class Compra extends Bebidas {

    private int cantidad;

    public double total() {
        return super.getPrecio() * cantidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
