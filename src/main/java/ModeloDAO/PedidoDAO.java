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

/**
 *
 * @author Obi_Juan
 */
public class PedidoDAO {

    public List<Pedido> listado() {
        Connection cn = MySQLConexion.getConexion();
        String sql = "select * from pedido";
        List<Pedido> lista = new ArrayList();
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setN_pedido(rs.getInt(1));
                p.setCost_acum(rs.getDouble(2));
                p.setCant(rs.getInt(3));
                p.setCliente(rs.getString(4));
                p.setBebida(rs.getString(5));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public void adicion(Pedido p) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO `pedido` VALUES (null,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setDouble(1, p.getCost_acum());
            st.setInt(2, p.getCant());
            st.setString(3, p.getCliente());
            st.setString(4, p.getBebida());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void actualiza(Pedido p) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "update pedido set cost_acum=?, cant=?, cliente=?, bebida=? where n_pedido=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setDouble(1, p.getCost_acum());
            st.setInt(2, p.getCant());
            st.setString(3, p.getCliente());
            st.setString(4, p.getBebida());
            st.setInt(4, p.getN_pedido());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void anula(int nro) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "delete from pedido where n_pedido=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, nro);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
