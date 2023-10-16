package Modelo;

public class Cliente {
    private String codc;
    private String ape;
    private String nom;
    private String clave;

    public Cliente() {
    }

    public Cliente(String codc, String ape, String nom, String clave) {
        this.codc = codc;
        this.ape = ape;
        this.nom = nom;
        this.clave = clave;
    }

    public String getCodc() {
        return codc;
    }

    public void setCodc(String codc) {
        this.codc = codc;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
}

