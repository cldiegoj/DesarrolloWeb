<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!--HEADER-->
    <header>
        <%@include file="header_footer/Header.jsp" %>
    </header>
    <main>
    	<section class="reclam">
    	<h2>libro de reclamaciones</h2>
		<p>En nuestra sección de <strong>Contáctos</strong>, le ofrecemos soluciones y distintas maneras en que puede comunicarse con nosotros, ya sea por nuestro correo, whatsapp o nuestras redes sociales para resolver cualquier dificultad que tenga. <br> Sin embargo, si usted no esta satisfecho con nuestro servicio, ponemos a su disposición el libro de reclamaciones, ya sea para ingresar una queja o reclamo.</p>

		<table>
			<tr>
				<td width="50%">¿Qué debo poner en una queja?<br>Debe mostrar su disconformidad respecto a la calidad de atención que brindamos por nuestros medios de comunicación.</td>
				<td>¿Qué debo poner en un reclamos?<br>Debe expresar su disconformidad respecto a nuestro servicio.</td>
			</tr>
		</table>
		<h1>¿Qué ocurrirá luego con su queja o reclamo?</h1>
		<p>Le enviaremos una copia como constancia a su correo electrónico. Además, en 48 horas hábiles como máximo, recibirás la respuesta.</p>	
		</section>

		<section class="reclam2">
				<form>
					<h1>Identificación del Consumidor Reclamante</h1>
					<p>Si usted es menor de Edad, llene el formulario con la información de sus padres.</p>
					<input class="reclam-input" type="text" name="NomApel" placeholder="Nombre y Apellido (ejem: José Martinez Tupac)"><br>
					<input class="reclam-input" type="text" name="DNI" placeholder="Documento de Identifiación (ejem. 70660666)"><br>
					<input class="reclam-input" type="text" name="Domicilio" placeholder="Lugar de Domicilio (Distrito, calle y número)"><br>
					<input class="reclam-input" type="text" name="Telef" placeholder="Número de Teléfono (ejem. 987769000)"><br>
					<input class="reclam-input" type="text" name="Gmail" placeholder="Gmail (ejem. JoseMT@gmail.com)"><br>
					<h1>¿Qué quiere registrar?</h1>
					<label for="Queja">Queja</label>
					<input type="radio" name="QuejRec" id="Queja">
					<label for="Reclamo">Reclamo</label>
					<input type="radio" name="QuejRec" id="Reclamo">	
					
				
					<h1>Detalle de la Reclamación y Pedido del Consumidor</h1>
					<h1>¿Cuál fue el Problema?</h1>
					<textarea></textarea>
					<h1>¿Qué solución espera?</h1>
					<textarea></textarea>
					<h1>Fecha y hora del Reclamo</h1>
					<input class="reclam-input" type="date" name="Anho"><br>
					<input class="reclam-input" type="time" name="Tiempo"><br>
					<input class="reclam-input" type="submit" name="Enviar" value="Enviar">
				</form>		
		</section>
    </main>

    <!--FOOTER-->
    <section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>



