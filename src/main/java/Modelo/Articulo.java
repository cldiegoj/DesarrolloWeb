package Modelo;

public class Articulo {
    private String coda;  // Cambiado de "cod" a "coda" para evitar conflictos de nombres
    private String nomart; // Cambiado de "nom" a "nomart" para evitar conflictos de nombres
    private String descripcion; // Cambiado de "descrip" a "descripcion" para evitar conflictos de nombres
    private double precio;
    private int stock;
    private String imagen;

    public Articulo() {
    }

    public String getCoda() {
        return coda;
    }

    public void setCoda(String coda) {
        this.coda = coda;
    }

    public String getNomart() {
        return nomart;
    }

    public void setNomart(String nomart) {
        this.nomart = nomart;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
