<html>
<head>
<link rel="stylesheet" type="text/css" href="bulma.css">
<meta charset="UTF-8">
<meta http-equiv = "refresh" content = "2; url = admin.jsp" />
<title>Sistema Fotovoltaico</title>
<script>
function mensaje()
{
var h=document.createElement("p");
var t=document.createTextNode("El estudio ha sido completado. Los resultados se enviarán por correo electrónico.");
h.appendChild(t);
document.body.appendChild(h);
}
</script>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String primernombre=request.getParameter("primernombre");
String segundonombre=request.getParameter("segundonombre");
String primerapellido=request.getParameter("primerapellido");
String segundoapellido=request.getParameter("segundoapellido");
String direccion=request.getParameter("direccion");
String correoelectronico=request.getParameter("correoelectronico");
String telefono=request.getParameter("telefono");
String consumo=request.getParameter("consumo");
String dimensiones=request.getParameter("dimensiones");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/uml", "root", "m24p12P1");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into formulario(primernombre, segundonombre, primerapellido, segundoapellido, direccion, correoelectronico, telefono, consumo, dimensiones)values('"+primernombre+"','"+segundonombre+"','"+primerapellido+"','"+segundoapellido+"','"+direccion+"','"+correoelectronico+"','"+telefono+"','"+consumo+"','"+dimensiones+"')");
        out.println("El formulario se ha guardado con éxito...");
        
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>

</body>
</html>


