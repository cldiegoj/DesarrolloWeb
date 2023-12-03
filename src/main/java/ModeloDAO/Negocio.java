/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Modelo.*;
import util.MySQLConexion;
import interfaces.Itienda;
import java.sql.CallableStatement;

public class Negocio implements Itienda {

    @Override
    public List<Categoria> listCat() {
        Connection cn = MySQLConexion.getConexion();
        List<Categoria> listaCategorias = new ArrayList<>();
        try {
            String sql = "SELECT cat_cod, cat_nom, cat_des, cat_img FROM categoria";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setCodc(rs.getString(1));
                c.setNomc(rs.getString(2));
                c.setDesc(rs.getString(3));
                c.setImagen(rs.getString(4));
                listaCategorias.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return listaCategorias;
    }

    @Override
    public List<Bebidas> listBeb(String id) {
        Connection cn = MySQLConexion.getConexion();
        List<Bebidas> listaArticulos = new ArrayList<>();
        try {
            String sql = "SELECT beb_cod, beb_nom, beb_des, beb_pre, beb_stk, beb_foto FROM bebida WHERE cat_cod=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bebidas b = new Bebidas();
                b.setCod(rs.getString(1));
                b.setNom(rs.getString(2));
                b.setDescrip(rs.getString(3));
                b.setPrecio(rs.getInt(4));
                b.setStock(rs.getInt(5));
                b.setFoto(rs.getString(6));
                listaArticulos.add(b);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return listaArticulos;
    }

    @Override
    public Bebidas busBeb(String id) {
        Connection cn = MySQLConexion.getConexion();
        Bebidas bebida = null;
        try {
            String sql = "SELECT beb_cod, beb_nom, beb_des, beb_pre, beb_stk, beb_foto FROM bebida WHERE beb_cod=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                bebida = new Bebidas();
                bebida.setCod(rs.getString(1));
                bebida.setNom(rs.getString(2));
                bebida.setDescrip(rs.getString(3));
                bebida.setPrecio(rs.getInt(4));
                bebida.setStock(rs.getInt(5));
                bebida.setFoto(rs.getString(6));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return bebida;
    }

    

    @Override
    public String grabaFac(String codc, List<Compra> lista) {
        String fac = "";
        double tot = 0;
        for(Compra x: lista){
            tot = tot+x.total();
        }    
            Connection cn = MySQLConexion.getConexion();
            try{
                CallableStatement st = cn.prepareCall("{CALL SPFACTURA(?,?)}");
                    st.setString(1, codc);
                    st.setDouble(2, tot);
                    ResultSet rs = st.executeQuery();
                    rs.next();
                    fac = rs.getString(1);

                    String sql = "{CALL SPdetalle(?,?,?)}";
                CallableStatement st2 = cn.prepareCall(sql);
                    for(Compra x: lista){
                        st2.setString(1, fac);
                        st2.setString(2, x.getCod());
                        st2.setInt(3,x.getCantidad());
                        st2.executeUpdate();
                    }
            }catch(Exception ex){
                ex.printStackTrace();
            }
        return fac;
    }
    
    
    // FILTRO DE DATOS DE FACTURAS (VENTAS) PARA LA APLICACION DE GRAFICAS
    public List<Ventas_graf>listMes(int a) {
        List<Ventas_graf> lis = new ArrayList<>();
            Connection cn = MySQLConexion.getConexion();
            try{
                String sql = "{call spventas(?)}"; // aca varias segun el nombre
                                                   // en la bd donde de guarde las ventas
                
                CallableStatement st = cn.prepareCall(sql);
                st.setInt(1, a);
                ResultSet rs = st.executeQuery();
                  while(rs.next()){
                    Ventas_graf ve = new Ventas_graf();
                    ve.setMes(rs.getInt(1));
                    ve.setCantidad(rs.getInt(2));
                    ve.setTotal(rs.getDouble(3));
                    }
            }catch(Exception ex){
                ex.printStackTrace();
            }
       return lis;
    }


    
    
}
