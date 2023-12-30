<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Sistema Fotovoltaico</title>
<style>
body {
  margin: 0;
}

* {
	font-family: Helvetica;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #333;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: white;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #04AA6D;
  color: white;
}

li a:hover:not(.active) {
  background-color: #111;
  color: white;
}
</style>
</head>
<body>
	<p style="font-family:Helvetica;font-size:xx-large;">Sistema Fotovoltaico</p>
	<p>Gestión de implementación de sistemas de energía solar residencial.</p>
<ul>
  <li><a class="active" href="#home">Página Inicial</a></li>
  <li><a href="generarformulario.html">Generar Formulario</a></li>
  <li><a href="usuarios.jsp">Gestión de Usuarios</a></li>
  <li><a href="formularios.jsp">Gestión de Formularios</a></li>
  <li><a href="generarestudio.jsp">Generar Estudio</a></li>
</ul>

<div style="margin-left:25%;padding:1px 16px;height:1000px;">
<table>
	<tr><td>IoT Sensor - Datos Piranométricos</td></tr>
	<tr><td>Irradiancia Global: <div id="irradiancia"></div></td></tr>
	<tr><td>Temperatura: <div id="temperatura"></div></td></tr>
	<tr><td>Latitud: <div id="latitud"></div></td></tr>
	<tr><td>Longitud: <div id="longitud"></div><td></tr>
	<tr><td>Horas del Sol Diarias: <div id="horas"></div></td></tr>
  <tr>
  <td colspan="2"><p><input type="submit" id="populateButton" value="Cargar Datos del Sensor" class="button-40" role="button"></p></td>
  <td colspan="2"><p><input type="submit" id="estudioButton" value="Generar Estudio del Sensor" class="button-40" role="button"></p></td>
  </tr>
  <tr><td><div id="resultado"></div></td></tr>
</table>
</div>

<script>
    $(document).ready(function () {
        $("#populateButton").click(function () {
            var irradiancia = "5.31 kWh/m2";
            $("#irradiancia").text(irradiancia);
            
            var temperatura = "20 °C";
            $("#temperatura").text(temperatura);
            
            var latitud = "25.766130";
            $("#latitud").text(latitud);
            
            var longitud = "-80.212631";
            $("#longitud").text(longitud);
            
            var horas = "10.9875";
            $("#horas").text(horas);
        }); // <-- Add this closing parenthesis

        $("#estudioButton").click(function () {
            var resultado = "Resultado: Implementación Viable";
            $("#resultado").text(resultado);
        }); // <-- Add this closing parenthesis
    });
</script>

</body>
</html>