<!DOCTYPE html>
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
			<?php foreach (listarPedido($conn) as $key => $value) { ; ?>
				    <tr>
				      <td><img src="<?=$value[5]?>" width="160px"	alt="..."></td>
				      <td>
				      <?php echo "<h5> Nombre: 		".$value[2]."</h3>".
				      			 "<h5> Descripción: ".$value[1]."</h3>".
				      			 "<h5> Cantidad: 	".$value[3]."</h3>".
				      			 "<h5> P.Acumulado: ".$value[4]."</h3>" ; 
				      			 $aux=$aux+$value[4];
						?>
				      </td>
				      <td><form method="post" action="../PHP/llamadas/proceso_envio.php">
							<input type="hidden" name="n_pedido" value="<?=$value[0]?>">
						  <input type="submit" class="btn btn-dark" name="action" value="Eliminar">				
						</form></td>
				    </tr>

			<?php } ?>
			  </tbody>
			</table>	
		</div>
	</div>
</main>

<!--Ventana Modal-->
    <input type="checkbox" id="btn-modal">
    <div class="container-modal">
        <div class="content-modal">
        	<h4>COSTO TOTAL: <?=$aux+10?></h4>
        	<form method="POST" action="../PHP/llamadas/proceso_envio.php">
        		<input type="hidden" name="cost_total" value="<?=$aux+10?>">
        		<input type="submit" name="action" value="¡¡COMPRAR!!">
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