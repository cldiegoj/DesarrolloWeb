package Modelo;

import java.util.Date;

public class Vehiculo {
    private String placa;
    private String marca;
    private Date f_rev;
    private Date f_soat;

    public Vehiculo() {
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Date getF_rev() {
        return f_rev;
    }

    public void setF_rev(Date f_rev) {
        this.f_rev = f_rev;
    }

    public Date getF_soat() {
        return f_soat;
    }

    public void setF_soat(Date f_soat) {
        this.f_soat = f_soat;
    }
    
    
}
