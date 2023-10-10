/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

public class UsuarioDAO {
    public void adicion(Usuario u){
     Connection cn=MySQLConexion.getConexion();
     String sql="INSERT INTO `usuario` VALUES (?,?,?,?,?,?,?,?)";
     try{
        PreparedStatement st=cn.prepareStatement(sql);
         st.setString(1, u.getDni());
         st.setString(2, u.getApelnom());
         st.setString(3, u.getUsrname());
         st.setString(4, u.getPass());
         st.setInt(5, u.getTelef());
         st.setString(6, u.getCorreo());
         st.setString(7, u.getDir());
         st.setString(8, u.getFoto());
         st.executeUpdate();
     }catch(Exception ex){
         ex.printStackTrace();
     }
     }
    
    public Usuario  login(String usr,String pas){
        Usuario p=null;
        Connection cn=MySQLConexion.getConexion();
        String sql="select usrname,pass from usuario where usrname=? and pass=? ";
        try{
          PreparedStatement st=cn.prepareStatement(sql);
          st.setString(1, usr);
          st.setString(2, pas);
          ResultSet rs=st.executeQuery();
          if(rs.next()){
              p=new Usuario();
              p.setUsrname(rs.getString(1));
              p.setPass(rs.getString(2));
          }    

        }catch(Exception ex){
            ex.printStackTrace();
        }
         return p;
      }

}
