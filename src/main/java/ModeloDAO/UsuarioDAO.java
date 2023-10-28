/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

public class UsuarioDAO {

    public void adicion(Usuario u) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO `usuario` VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, u.getCod());
            st.setString(2, u.getNom());
            st.setString(3, u.getApe());
            st.setString(4, u.getUsr());
            st.setString(5, u.getPass());
            st.setInt(6, u.getTel());
            st.setString(7, u.getCor());
            st.setString(8, u.getDir());
            st.setString(9, u.getFoto());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Usuario login(String usr, String pas) {
        Usuario p = null;
        Connection cn = MySQLConexion.getConexion();
        String sql = "select cli_cod, cli_nom, cli_ape, cli_usr, cli_pass, cli_tel, cli_cor, cli_dir, cli_foto from usuario where cli_usr=? and cli_pass=? ";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, usr);
            st.setString(2, pas);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p = new Usuario();
                p.setCod(rs.getString(1));
                p.setNom(rs.getString(2));
                p.setApe(rs.getString(3));
                p.setUsr(rs.getString(4));
                p.setPass(rs.getString(5));
                p.setTel(rs.getInt(6));
                p.setCor(rs.getString(7));
                p.setDir(rs.getString(8));
                p.setFoto(rs.getString(9));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return p;
    }

    // FILTRO DE USUARIO MEDIANTE NOMBRE
    public List<Usuario> filtrarUsuario(String id) {
        List<Usuario> lis = new ArrayList<>();
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "select cli_cod, cli_nom, cli_ape, cli_usr,cli_pass,cli_tel,cli_cor,cli_dir,cli_foto usuario\n"
                    + "where cli_nom like ? or cli_ape like ?";
            //? =equivale a un parametro 
            PreparedStatement st = conn.prepareStatement(sql);
            //relacionar el ? con su variable 
            st.setString(1, "%" + id + "%");
            st.setString(2, "%" + id + "%");

            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
                Usuario a = new Usuario();
                a.setCod(rs.getString(1));
                a.setNom(rs.getString(2));
                a.setApe(rs.getString(3));
                a.setUsr(rs.getString(4));
                a.setPass(rs.getString(5));
                a.setTel(rs.getInt(6));
                a.setCor(rs.getString(7));
                a.setDir(rs.getString(8));
                a.setFoto(rs.getString(9));
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
