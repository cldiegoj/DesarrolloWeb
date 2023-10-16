/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.*;
import DAO.Negocio;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class control extends HttpServlet {
    
    Negocio negocio = new Negocio();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("opc");
        if (op.equals("listarProductosPorCategoria")) {
            listarProductosPorCategoria(request, response);
        } else if (op.equals("verDetalleProducto")) {
            verDetalleProducto(request, response);
        } else if (op.equals("agregarAlCarrito")) {
            agregarAlCarrito(request, response);
        }
    }

    private void listarProductosPorCategoria(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String codCategoria = request.getParameter("codCategoria");
        List<Articulo> productos = negocio.listArt(codCategoria);
        
        request.setAttribute("productos", productos);
        
        String pagina = "productos.jsp";  // Nombre de tu JSP de visualización de productos
        request.getRequestDispatcher(pagina).forward(request, response);
    }
    
    private void verDetalleProducto(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String codigoProducto = request.getParameter("codigoProducto");
        
        Articulo producto = negocio.busArt(codigoProducto);
        
        request.setAttribute("producto", producto);
        
        String pagina = "detalleProducto.jsp";  // Nombre de tu JSP de detalle de producto
        request.getRequestDispatcher(pagina).forward(request, response);
    }
    
   private void agregarAlCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        String cod = request.getParameter("cod");
        int can = Integer.parseInt(request.getParameter("cantidad"));

        Negocio negocio = new Negocio();

        Articulo ar = negocio.busArt(cod);
        Compra cp = new Compra();
        cp.setCantidad(can);
        cp.setCod(cod);
        cp.setImagen(ar.getImagen());

      
        cp.setPrecio(ar.getPrecio());

        List<Compra> lista;
        if (ses.getAttribute("canasta") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        }
        lista.add(cp);
        ses.setAttribute("canasta", lista);

        String pagina = "pagCompra.jsp"; // Asegúrate de que esta sea la ruta correcta a tu página de carrito
        request.getRequestDispatcher(pagina).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
