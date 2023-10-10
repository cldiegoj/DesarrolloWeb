package ModeloDAO;

import Modelo.Pedido;
import Modelo.Reclamo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.MySQLConexion;

public class ReclamoDAO {

    public void adicion(Reclamo r) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO `reclamos` VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, r.getApelnom());
            st.setString(2, r.getDni());
            st.setString(3, r.getDir());
            st.setInt(4, r.getTelef());
            st.setString(5, r.getCorreo());
            st.setString(6, r.getTipo());
            st.setString(7, r.getDescripcion());
            st.setString(8, r.getSolucion());
            st.setString(9, r.getFecha());
            st.setString(10, r.getHora());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
