
$(document).ready(function () {  
   //cuando se escriba caracteres en la caja de texto  
    $(document).on('keyup','#txtnom',function(){ 
        let valor = $(this).val();  
             listado(valor);  
         
    });  
     
   function listado(consulta) {  
        opc = "4";  
        $.get("ctrlUsuario", {opc, consulta}, (response) => {  
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador  
            let template = "";  
             console.log(misDatos);  
             
           template += `  
             <table class="table table-hover">  
                                    <thead class="text-white bg-dark">  
                                        <tr>  
                                            <th>DNI</th>  
                                            <th>Nombre y Apellido</th>  
                                            <th>Telefono</th> 
                                            <th>Correo</th> 
                                            <th>Dirección</th> 
                                            <th>Ver</th> 
                                           </tr>  
                                    </thead>  
                                    <tbody>`;    
            misDatos.forEach(midato => {  
                template += `  
                <tr>  
                <td>${midato.dni}</td>  
                    <td>${midato.apelnom}</td>  
                    <td>${midato.telef}</td>  
                    <td>${midato.correo}</td>  
                    <td>${midato.dir}</td>  
                    <td><a href="javascript:pasaSeleccion('${midato.cod}', '${midato.nom}');"> 
<img src="botones/Edit.gif" height="20" width="20" class="center-block"></a> 
                                </tr>`;              
                  
            })  
            template += `</tbody></table>`;  
            $("#tablares").html(template);  
  
        })  
    } //fin de listado 
     
}) 
    