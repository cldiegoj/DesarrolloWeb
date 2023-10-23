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
    public Cliente busCli(String usr, String pas) {
        Connection cn = MySQLConexion.getConexion();
        Cliente cliente = null;
        try {
            String sql = "SELECT Apellidos, Nombres FROM clientes WHERE idcliente=? AND Password=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, usr);
            st.setString(2, pas);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setCodc(usr);
                cliente.setApe(rs.getString(1));
                cliente.setNom(rs.getString(2));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return cliente;
    }

    @Override
    public String grabaFac(String codc, List<Compra> lista) {
        String fac = "";
        double tot = 0;
        for (Compra compra : lista) {
            tot = tot + compra.total();
        }
        Connection cn = MySQLConexion.getConexion();
        try {
            // Lógica para grabar la factura en la base de datos
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return fac;
    }
}