package ModeloDAO;

import Modelo.Pedido;
import Modelo.Reclamo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.MySQLConexion;

public class ReclamoDAO {

    public void adicion(Reclamo r) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO `reclamos` VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, r.getId_reclamo());
            st.setString(2, r.getApelnom());
            st.setString(3, r.getDni());
            st.setString(4, r.getDir());
            st.setInt(5, r.getTelef());
            st.setString(6, r.getCorreo());
            st.setString(7, r.getTipo());
            st.setString(8, r.getDescripcion());
            st.setString(9, r.getSolucion());
            st.setString(10, r.getFecha());
            st.setString(11, r.getHora());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void anula(int nro) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "delete from reclamos where id_reclamo=?";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, nro);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
