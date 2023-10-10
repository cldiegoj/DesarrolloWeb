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
}
