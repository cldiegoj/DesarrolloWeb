<!DOCTYPE html>
<%@page import="Modelo.Pedido,ModeloDAO.PedidoDAO" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/modal_estilo.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
            <%@include file="header_footer/Header.jsp" %>
	</header>
	

<main class="carrito">
	<div class="header-content container">

		<div>
			<div class="alert alert-light" role="alert">
			<marquee behaviour="slide" direction="left">"PROHIBIDA LA VENTA Y/O ENTREGA DE BEBIDAS ALCOHÓLICAS A MENORES DE 18 AÑOS?, ?SI HAS INGERIDO BEBIDAS ALCOHÓLICAS, NO MANEJES?, ?TOMAR EN EXCESO ES DAÑINO PARA LA SALUD?, ?EN ESTE LOCAL LA VENTA DE BEBIDAS ALCOHÓLICAS ES DE HASTA LAS 2AM?</marquee>
			
			<!--Boton-->
			    <div class="boton-modal">
			        <label for="btn-modal">
			            ¡MÁNDAME MIS CHELAS!
			        </label>
			    </div>
			<!--Fin de Boton-->

                            <%
                                
                                String n=(String)session.getAttribute("estado");
                                String dni=(String)session.getAttribute("dni");
                                if(n.equalsIgnoreCase("activo")){
                                    %> 
                                    <a href="ctrlUsuario?opc=3"><img src="imagenes/logout.png" width="30px" class="rounded float-end" alt="..."></a>
                                    <%
                                }else{
                                    request.getRequestDispatcher("/Principal.jsp").forward(request, response);
                                }
                             %> 

			</div>
		</div>
		
		<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">Trago</th>
				      <th scope="col">Detalles</th>
				      <th scope="col">Quitar?</th>
				    </tr>
				  </thead>
			<%
                            double p_total=0;
                            PedidoDAO obj = new PedidoDAO();
                            for(Pedido x : obj.listado(dni)){
                        %>
				    <tr>
				      <td><img src="otros recursos/BEBIDAS/<%=x.getFoto()%>" width="160px" alt="..."></td>
				      <td>
                                        <h5> <%=x.getNom()%>.</h5>
                                        <h5> <%=x.getDescrip()%>.</h5>
                                        <h5> Cantidad: <%=x.getCant()%></h5>
				      	<h5> P.Acumulado: <%=x.getCost_acum()%></h5>
				      </td>
				      <td>
                                          <form method="post" action="ctrlPedido">
                                              <input type="hidden" name="opc" value="2">
                                            <input type="hidden" name="n_pedido" value="<%=x.getId()%>">
                                            <button type="submit" class="btn btn-dark">Eliminar</button>
                                          </form>
                                      </td>
				    </tr>
                        <%
                            p_total=p_total+x.getCost_acum();
                            }
                        %>
			  </tbody>
			</table>	
		</div>
	</div>
</main>

<!--Ventana Modal-->
    <input type="checkbox" id="btn-modal">
    <div class="container-modal">
        <div class="content-modal">
        	<h4>COSTO TOTAL: <%=p_total%></h4>
        	<form method="POST" action="ctrlEnvio">
        		<input type="hidden" name="cost_total" value="<%=p_total%>">
                        <input type="hidden" name="opc" value="1">
                        <button type="submit">¡¡COMPRAR!!</button>
        	</form> 
            <div class="btn-cerrar">
                <label for="btn-modal">Cerrar</label>
            </div>
        </div>
        <label for="btn-modal" class="cerrar-modal"></label>
    </div>
<!--Fin de Ventana Modal-->			


	<section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="js/script.js"></script>

</body>
</html>
