var cont=true;
document.getElementById("alerta").style.display="none";
document.getElementById("btn").onclick=function(){
    document.getElementById("alerta").style.display="";
    document.getElementById("btn").style.display="none";
    borroso();
}
document.getElementById("alerta").onclick=function(){
    document.getElementById("btn").style.display="";
    document.getElementById("alerta").style.display="none";
    borroso();
}
function borroso(){
    if(cont==true){
        document.getElementById("imga").style.filter="blur(10px)";
        cont=false;
    }else{
        document.getElementById("imga").style.filter="blur(0)";
        cont=true;
    }
}
