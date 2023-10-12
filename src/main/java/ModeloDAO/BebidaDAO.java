/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.Bebidas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

/**
 *
 * @author LENOVO
 */
public class BebidaDAO {
    public List<Bebidas> listado(){
     Connection cn=MySQLConexion.getConexion();
     String sql="select * from bebida";
     List<Bebidas> lista=new ArrayList();
     try{
        PreparedStatement st=cn.prepareStatement(sql);
         ResultSet rs=st.executeQuery();
         while(rs.next()){
             Bebidas b=new Bebidas();
             b.setCod(rs.getString(1));
             b.setNom(rs.getString(2));
             b.setDescrip(rs.getString(3));
             b.setPrecio(rs.getInt(4));
             b.setFoto(rs.getString(5));
             lista.add(b);
         }
     }catch(Exception ex){
         ex.printStackTrace();
     }
         return lista;
     }
    
    public void adicion(Bebidas b) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO BEBIDA VALUES(?,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, b.getCod());
            st.setString(2, b.getNom());
            st.setString(3, b.getDescrip());
            st.setDouble(4, b.getPrecio());
            st.setString(5, b.getFoto());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void actualiza(Bebidas b) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "update bebida set nom=?, descrip=?, precio=? where cod=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, b.getNom());
            st.setString(2, b.getDescrip());
            st.setDouble(3, b.getPrecio());
            st.setString(4, b.getCod());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void anula(String nro) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "delete from bebida where cod=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, nro);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    // FILTRADO DE BEBIDAS MEDIANTE EL NOMBRE DE LA BEBIDA 
     public List<Bebidas> filtrarBeb(String id) {
        List<Bebidas> lis = new ArrayList<>();
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "select cod, nom, descrip, precio from bebida\n" +
                "where nom like ?";
 
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%"+id+"%");
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
               Bebidas a = new Bebidas();
                a.setCod(rs.getString(1));
                a.setNom(rs.getString(2));
                a.setDescrip(rs.getString(3));
                a.setPrecio(rs.getDouble(4));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }

        return lis;
    }
}
