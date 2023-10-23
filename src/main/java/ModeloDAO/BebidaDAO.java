/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.Bebidas;
import Modelo.Grafico;
import java.sql.CallableStatement;
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
             b.setStock(rs.getInt(5));
             b.setFoto(rs.getString(6));
             b.setCat_cod(rs.getString(7));
             b.setPro_cod(rs.getString(8));
             lista.add(b);
         }
     }catch(Exception ex){
         ex.printStackTrace();
     }
         return lista;
     }
    
    public void adicion(Bebidas b) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO BEBIDA VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, b.getCod());
            st.setString(2, b.getNom());
            st.setString(3, b.getDescrip());
            st.setDouble(4, b.getPrecio());
            st.setInt(5, b.getStock());
            st.setString(6, b.getFoto());
            st.setString(7, b.getCat_cod());
            st.setString(8, b.getPro_cod());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void actualiza(Bebidas b) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "update bebida set beb_nom=?, beb_des=?, beb_pre=? where beb_cod=?";
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
        String sql = "delete from bebida where beb_cod=?";
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
            String sql = "select beb_cod, beb_nom, beb_des, beb_pre, beb_stk, beb_foto from bebida\n" +
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
                a.setStock(rs.getInt(5));
                a.setFoto(rs.getString(6));
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
     
     public List<Grafico> lisBebida() {
        List<Grafico> lis = new ArrayList<>();
        Connection conn = null;
      try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT\n" +
"  SUM(CASE WHEN LEFT(`cod`, 1) = 'C' THEN 1 ELSE 0 END) AS cantidad_cervezas,\n" +
"  SUM(CASE WHEN LEFT(`cod`, 1) = 'W' THEN 1 ELSE 0 END) AS cantidad_whiskys\n" +
"FROM `bebida`;";
            //? =equivale a un parametro 
            CallableStatement st = conn.prepareCall(sql);
            //relacionar el ? con su variable 
           ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
               Grafico a = new Grafico();
                a.setCervesas(rs.getInt(1));
                a.setWhiskys(rs.getInt(2));
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
