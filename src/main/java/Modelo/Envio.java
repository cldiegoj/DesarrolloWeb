
package Modelo;

import java.util.Date;

public class Envio {
    private int id;
    private double cost_env;
    private double cost_total;
    private Date h_env;
    private Date h_rec;
    private String estado;

    public Envio() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getCost_env() {
        return cost_env;
    }

    public void setCost_env(double cost_env) {
        this.cost_env = cost_env;
    }

    public double getCost_total() {
        return cost_total;
    }

    public void setCost_total(double cost_total) {
        this.cost_total = cost_total;
    }

    public Date getH_env() {
        return h_env;
    }

    public void setH_env(Date h_env) {
        this.h_env = h_env;
    }

    public Date getH_rec() {
        return h_rec;
    }

    public void setH_rec(Date h_rec) {
        this.h_rec = h_rec;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}