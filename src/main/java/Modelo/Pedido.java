package Modelo;
public class Pedido {
    private double cost_acum;
    private int cant;
    private String cliente;
    private String bebida;
    
    public Pedido() {
    }
    
    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getBebida() {
        return bebida;
    }

    public void setBebida(String bebida) {
        this.bebida = bebida;
    }

    public double getCost_acum() {
        return cost_acum;
    }

    public void setCost_acum(double cost_acum) {
        this.cost_acum = cost_acum;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }
    
    
}
