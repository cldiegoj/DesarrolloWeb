/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


public class Ventas_graf {
    private int mes;
    private int cantidad;
    private double total;
    public String Vmes(){
        String vec[]={"","Ene", "Feb","Mar","Abr","May",
        "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Dic"};
        return vec[mes];
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    

    
}
