package Modelo;

import java.util.Date;

public class Vehiculo {

    private String cod;
    private String placa;
    private String marca;
    private Date soat;
    private String con_cod;

    public Vehiculo() {
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
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

    public Date getSoat() {
        return soat;
    }

    public void setSoat(Date soat) {
        this.soat = soat;
    }

    public String getCon_cod() {
        return con_cod;
    }

    public void setCon_cod(String con_cod) {
        this.con_cod = con_cod;
    }

}
