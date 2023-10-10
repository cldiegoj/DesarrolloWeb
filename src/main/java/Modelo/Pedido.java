package Modelo;
public class Pedido {
    private String n_pedido;
    private double cost_acum;
    private int cant;

    public Pedido() {
    }

    public String getN_pedido() {
        return n_pedido;
    }

    public void setN_pedido(String n_pedido) {
        this.n_pedido = n_pedido;
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
