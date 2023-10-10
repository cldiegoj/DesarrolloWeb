/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Modelo.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.MySQLConexion;

/**
 *
 * @author Obi_Juan
 */
public class PedidoDAO {
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
}