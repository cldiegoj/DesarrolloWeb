package ModeloDAO;

import Modelo.*;
import Modelo.Reclamo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.MySQLConexion;

public class ReclamoDAO {

    public void adicion(Reclamo r) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO `reclamos` VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, r.getCod());
            st.setInt(2, r.getDni());
            st.setString(3, r.getTipo());
            st.setString(4, r.getDescrip());
            st.setString(5, r.getSolucion());
            st.setString(6, r.getFecha());
            st.setString(7, r.getHora());
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
