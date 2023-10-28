package Controlador;

import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ctrlUsuario extends HttpServlet {

    UsuarioDAO obj = new UsuarioDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      int op=Integer.parseInt(request.getParameter("opc"));
      if(op==1)adicionUsuario(request, response);
      if(op==2)login(request, response);
      if(op==3)cerrar(request,response);
      if(op==4)filtrar(request, response);

    }
    
    protected void adicionUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      Usuario u=new Usuario();
      u.setNom(request.getParameter("nombres"));
      u.setApe(request.getParameter("apellidos"));
      u.setUsr(request.getParameter("usrname"));
      u.setPass(request.getParameter("pass"));
      u.setCor(request.getParameter("correo"));
      u.setTel(Integer.parseInt(request.getParameter("telef")));
      u.setDir(request.getParameter("dir"));
      u.setFoto(request.getParameter("foto"));
      obj.adicion(u);
      String pag="/login.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user=request.getParameter("usrname");
        String clave=request.getParameter("pass");
        Usuario p=obj.login(user, clave);
        String pag="";
        String mensaje="";
        if(p==null){
            //Si no existen las credenciales te regresa al Login e imprime mensaje de error
            mensaje = "Nombre de usuario o contraseña incorrecta";
            request.setAttribute("mensaje", mensaje);
            pag="/login.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        }else{
            //Se activa la sesion
            HttpSession session=request.getSession();
            session.setAttribute("estado", p);
            pag="/Principal.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        }
     }
    
    protected void cerrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.setAttribute("estado", null);
        String pag="/Principal.jsp";
        
        request.getRequestDispatcher(pag).forward(request, response);
        
     }
    
    // FILTRO DE USUARIO 
      protected void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String con=request.getParameter("consulta");
        Gson gs=new Gson();
        out.print(gs.toJson(obj.filtrarUsuario(con)));
      }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
