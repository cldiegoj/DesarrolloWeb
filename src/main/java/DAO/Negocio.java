/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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
            String sql = "SELECT idcategoria, descripcion, imagen FROM categorias";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setCodc(rs.getString(1));
                categoria.setNomc(rs.getString(2));
                categoria.setImagen(rs.getString(3));
                listaCategorias.add(categoria);
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
    public List<Articulo> listArt(String id) {
        Connection cn = MySQLConexion.getConexion();
        List<Articulo> listaArticulos = new ArrayList<>();
        try {
            String sql = "SELECT coda, nomart, precio, stock, imagen FROM articulos WHERE idcategoria=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Articulo articulo = new Articulo();
                articulo.setCoda(rs.getString(1));
                articulo.setNomart(rs.getString(2));
                articulo.setPrecio(rs.getDouble(3));
                articulo.setStock(rs.getInt(4));
                articulo.setImagen(rs.getString(5));
                listaArticulos.add(articulo);
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
    public Articulo busArt(String id) {
        Connection cn = MySQLConexion.getConexion();
        Articulo articulo = null;
        try {
            String sql = "SELECT coda, nomart, precio, stock, imagen FROM articulos WHERE coda=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                articulo = new Articulo();
                articulo.setCoda(rs.getString(1));
                articulo.setNomart(rs.getString(2));
                articulo.setPrecio(rs.getDouble(3));
                articulo.setStock(rs.getInt(4));
                articulo.setImagen(rs.getString(5));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return articulo;
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
