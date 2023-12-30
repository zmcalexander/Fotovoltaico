<%@ page import="Estudio.generarPDFestudio" %>
<%@ page import="Estudio.EmailAttachment" %>
<%@ page import="Estudio.SunriseSunsetAPICall" %>
<%@ page import="Estudio.GeocodeMapsCoAPICall" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bulma.css">
<meta charset="ISO-8859-1">
<meta http-equiv = "refresh" content = "2; url = admin.jsp" />
<title>Sistema Fotovoltaico</title>
</head>
<body>
 <div align="center">
 
 <%
    // Retrieve form data using request.getParameter()
    String correo = request.getParameter("correoelectronico");

   // Use the data as needed in your JSP
   // out.println("<h2>Received Form Data:</h2>");
   // out.println("<p>Parameter 1: " + correo + "</p>");
   
   	generarPDFestudio pdf = new generarPDFestudio();
   	pdf.generarEstudio(correo);
   	EmailAttachment email = new EmailAttachment();
   	email.enviarCorreo(correo);
 // consumo > number of sun hours * number of panels * 300w * 30 not approved
 // consumo <= number of sun hours * number of panels * 300w * 30  approved
	
   	
   	
%>

  <h1>El estudio ha sido completado. Los resultados se enviarán por correo electrónico...</h1>
 </div>
</body>
</html>