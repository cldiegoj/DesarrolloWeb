/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.*;
import ModeloDAO.*;
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
        if (op.equals("1")) {
            listarProductosPorCategoria(request, response);
        }
        if (op.equals("2")) {
            verDetalleProducto(request, response);
        }
        if (op.equals("3")) {
            agregarAlCarrito(request, response);
        }
        if (op.equals("4")) {
            EliminarBebidaCarrito(request, response);
        }
        if (op.equals("5")) {
            GrabarFactura(request, response);
        }
    }

    private void listarProductosPorCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cod = request.getParameter("cod");
        request.setAttribute("dato", negocio.listBeb(cod));

        String pag = "Articulo.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    private void verDetalleProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");

        request.setAttribute("dato", negocio.busBeb(cod));

        String pag = "Detalle.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    private void agregarAlCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        String cod = request.getParameter("cod");
        int can = Integer.parseInt(request.getParameter("cantidad"));

        Bebidas ar = negocio.busBeb(cod);
        Compra cp = new Compra();
        cp.setCantidad(can);
        cp.setCod(cod);
        cp.setFoto(ar.getFoto());
        cp.setNom(ar.getNom());
        cp.setPrecio(ar.getPrecio());

        List<Compra> lista;
        if (ses.getAttribute("canasta") == null) {
            lista = new ArrayList(); //Se crea la lista
        } else {
            lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        }
        boolean sw = false;//para buscar un item 
        for (Compra x : lista) {
            if (x.getCod().equals(cod)) {
                sw = true;
                break;
            }
        }
        if (!sw) {
            lista.add(cp);
        }
        ses.setAttribute("canasta", lista);

        String pag = "Compra.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    private void EliminarBebidaCarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");
        int indice = Integer.parseInt(request.getParameter("indice"));

        HttpSession ses = request.getSession();
        List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");

        lista.remove(indice);
        ses.setAttribute("canasta", lista);
        String pag = "Compra.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    private void GrabarFactura(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        Usuario cli = (Usuario) ses.getAttribute("estado");
        String fac = negocio.grabaFac(cli.getCod(), lista);
        double sm = 0;
        String ape = cli.getApe()+ "," + cli.getNom();
        for (Compra c : lista) {
            sm = sm + c.total();
        }
        request.setAttribute("factura", fac);
        request.setAttribute("nombre", ape);
        request.setAttribute("total", sm);
        ses.setAttribute("canasta", null);
        /*String cad="Apellido y Nombre:"+ape;
        cad+="<br> Factura generada :"+fac;
        cad+="<br> Total a pagar :"+sm;
        response.sendRedirect("qrimage?texto="+cad);
         */
        String pag = "/Resumen.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
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
