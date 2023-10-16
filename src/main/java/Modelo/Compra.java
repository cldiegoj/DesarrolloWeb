package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.SQLConexion;



public class Compra {
    private String cod;
    private int cantidad;
    private String imagen;

    public Compra(String cod, int cantidad, String imagen) {
        this.cod = cod;
    this.cantidad = cantidad;
    this.imagen = imagen;
    }

    public Compra() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public double total() {
        // Obtener el precio del artículo con el código 'cod' de la base de datos
        double precio = obtenerPrecioDesdeBaseDeDatos(cod);
        return precio * cantidad;
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    

   private double obtenerPrecioDesdeBaseDeDatos(String cod) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    double precio = 0.0;

    try {
        // Establecer la conexión a la base de datos utilizando tu clase SQLConexion
        conn = SQLConexion.getConexion();

        // Crear y ejecutar una consulta SQL para obtener el precio
        String sql = "SELECT precio FROM articulos WHERE coda = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, cod);
        rs = stmt.executeQuery();

        // Recuperar el precio de la consulta
        if (rs.next()) {
            precio = rs.getDouble("precio");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } 

    return precio;
}
   public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setPrecio(double precio) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }



}
