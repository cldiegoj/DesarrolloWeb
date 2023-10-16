
<%@page import="ModeloDAO.BebidaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*,ModeloDAO.*" %>
<!DOCTYPE html>
<script src="js/Chart.min.js" type="text/javascript"></script>
  <style>
    .container {
      width: 70%;
      margin: 15px auto;
    }
    body {
      text-align: center;
      color: green;
    }
    h2 {
      text-align: center;
      font-family: "Verdana", sans-serif;
      font-size: 30px;
    }
  </style>
  <body>
<%
      BebidaDAO obj=new BebidaDAO();
      String op=request.getParameter("op");
      String color="";
      if(op.equals("bar")|| op.equals("line")){
         color="'rgba(153,205,1,0.6)'";
    }
      if(op.equals("pie")){
      color="['rgba(153,205,1,0.6)','peru','red','blue','yellow','orange']";  
        }
      String label="",data="";
      for(Grafico x:obj.lisBebida()){
      label += "'"+x.Lmes()+"',";
      data += x.getTotal()+",";
       }
       if(obj.lisMes(an).size()>0){
       label=label.substring(0, label.length()-1);
       data=data.substring(0, data.length()-1);
    }
 %>   
   
    <div class="container">
      <h2>Grafico de ventasx mes de: <%=an%></h2>
      <div>
        <canvas id="myChart"></canvas>
      </div>
    </div>
  </body>
  <script>
    var ctx = document.getElementById("myChart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "<%=op%>",
      data: {
        labels: [<%=label%> ],
        datasets: [
          {
            label: "Ventas",
            data: [<%=data%>],
            backgroundColor:<%=color%>,
          },
          
        ],
      },
    });
  </script>