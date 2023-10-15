/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

/**
 *
 * @author Obi_Juan
 */
public class EnvioDAO {
    public List<Envio> listado(){
     Connection cn=MySQLConexion.getConexion();
     String sql="select * from envio";
     List<Envio> lista=new ArrayList();
     try{
        PreparedStatement st=cn.prepareStatement(sql);
         ResultSet rs=st.executeQuery();
         while(rs.next()){
             Envio e=new Envio();
             e.setId(rs.getInt(1));
             e.setCost_env(rs.getDouble(2));
             e.setCost_total(rs.getDouble(3));
             e.setH_env(rs.getDate(4));
             e.setH_rec(rs.getDate(5));
             e.setEstado(rs.getString(6));
             e.setConductor(rs.getString(7));
             lista.add(e);
         }
     }catch(Exception ex){
         ex.printStackTrace();
     }
         return lista;
     }
    
    public void adicion(Envio e){
     Connection cn=MySQLConexion.getConexion();
     String sql="INSERT INTO `envio` VALUES (null,?,?,now(),now(),'enviado','11111111')";
     try{
        PreparedStatement st=cn.prepareStatement(sql);
         st.setDouble(1, e.getCost_env());
         st.setDouble(2, e.getCost_total());
         st.executeUpdate();
     }catch(Exception ex){
         ex.printStackTrace();
     }
     }
    
    public void actualiza(Envio e) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "update envio set cost_env=?, cost_total=?, h_env=?, h_rec=?, estado=?, conductor=? where id=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setDouble(1, e.getCost_env());
            st.setDouble(2, e.getCost_total());
            st.setDate(3, (Date) e.getH_env());
            st.setDate(4, (Date)e.getH_rec());
            st.setString(5, e.getEstado());
            st.setString(6, e.getConductor());
            st.setInt(7, e.getId());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void anula(int nro) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "delete from envio where id=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, nro);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
