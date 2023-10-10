<!DOCTYPE html>
<%@page import="Modelo.Bebidas,ModeloDAO.BebidaDAO" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		
		<?php
<!--			require '../PHP/Controlador/conexion.php';-->
			$conn = conectar();
			include 'header/header.php';
        ?>
        <%@include file="header_footer/Header.jsp" %>
	</header>



<main class="carrito">
	<div class="header-content container">

			<div class="alert alert-success">
				<a href="Micarrito.jsp" class="badge badge-success">Ver carrito</a>
				<a href="FiltroVinos.jsp" class="badge badge-success">Buscar chelas!</a>

                            <%
                                //aqui ponemos conedicional de session
                                //si esta activo aparece el boton de cerrar sesion
                                //sino redirige a otra pag 
                             %> 
			</div>

			<div class="row">
				
			<!--Esto es lo que se repetir� para cada producto-->
			<%
                            BebidaDAO obj = new BebidaDAO();
                            for(Bebidas x : obj.listado()){
                        %>
				<div class="col-3">
					<div class="card">
						<img title="T�tulo producto" alt="T�tulo" class="card-img-top" src="otros recursos/BEBIDAS/<%=x.getCod()%>.png">
						<div>
							<span><%=x.getNom()%></span>
							<h5 class="card-title"><%=x.getDescrip()%></h5>
							<p class="card-text">S/. <%=x.getPrecio()%></p>
							<!--<form method="post" action="../PHP/llamadas/proceso_pedido.php">-->
								<label>Cantidad: </label><input type="text" name="cant">
								<input type="hidden" name="cod" value="<%=x.getCod()%>">

								<input type="hidden" name="cost" value="<%=x.getPrecio()%>">
                                                                <!--n_pedido se forma con "cliente" y con un "autoincrementable"-->
								<!--cliente se obtiene con un session-->
								<input class="btn btn-primary" type="submit">
							</form>
						</div>
					</div>
				</div>
			<%
                            }  
                        %>					
			<!---------------------------------- -->
				
			</div>
	</div>
</main>
	<section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>



    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script src="js/script.js"></script>
</body>
</html>