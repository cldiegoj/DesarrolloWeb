
$(document).ready(function () {  
   //cuando se escriba caracteres en la caja de texto  
    $(document).on('keyup','#txtnom',function(){ 
        let valor = $(this).val();  
             listado(valor);  
         
    });  
     
   function listado(consulta) {  
        opc = "1";  
        $.get("ctrlBebida", {opc, consulta}, (response) => {  
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador  
            let template = "";  
             console.log(misDatos);  
             
           template += `  
             <table class="table table-hover">  
                                    <thead class="text-white bg-dark">  
                                        <tr>  
                                            <th>Codigo</th>  
                                            <th>Nombre</th>  
                                            <th>Descripcion</th> 
                                            <th>Precio</th> 
                                            <th>Ver</th> 
                                           </tr>  
                                    </thead>  
                                    <tbody>`;    
            misDatos.forEach(midato => {  
                template += `  
                <tr>  
                <td>${midato.cod}</td>  
                    <td>${midato.nom}</td>  
                    <td>${midato.descrip}</td>  
                    <td>${midato.precio}</td>  
                    <td><a href="javascript:pasaSeleccion('${midato.cod}', '${midato.nom}');"> 
<img src="botones/Edit.gif" height="20" width="20" class="center-block"></a> 
                                </tr>`;              
                  
            })  
            template += `</tbody></table>`;  
            $("#tablares").html(template);  
  
        })  
    } //fin de listado 
     
}) 
    