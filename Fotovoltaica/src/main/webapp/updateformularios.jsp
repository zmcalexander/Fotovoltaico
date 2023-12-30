<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="bulma.css">
<meta charset="UTF-8">
<title>Sistema Fotovoltaico</title>
</head>
<body>
	
	<%	
	Connection connect = null;
	Statement s = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/uml" +
				"?user=root&password=m24p12P1");
		
		s = connect.createStatement();
		
		String correoelectronico = request.getParameter("correoelectronico");

		String sql = "SELECT * FROM  formulario WHERE correoelectronico = '" + correoelectronico + "'  ";
		
		ResultSet rec = s.executeQuery(sql);
		if(rec != null) {
			rec.next();
		%>
	<form name="frmUpdate" method="post" action="guardarformularios.jsp?correoelectronico=<%=rec.getString("correoelectronico")%>">	
	<h1>Cambiar Formulario</h1>
			<table width="428" border="1">	
			<tr>
				<th width="181">
				<div align="left">Primer Nombre </div></th>
				<td width="231"><%=rec.getString("primernombre")%></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Segundo Nombre </div></th>
				<td><input type="text" name="segundonombre" size="20" value="<%=rec.getString("segundonombre")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Primer Apellido </div></th>
				<td><input type="text" name="primerapellido" size="20" value="<%=rec.getString("primerapellido")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Segundo Apellido </div></th>
				<td><input type="text" name="segundoapellido" size="2" value="<%=rec.getString("segundoapellido")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Direccion </div></th>
				<td><input type="text" name="direccion" size="5" value="<%=rec.getString("direccion")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Correo Electronico </div></th>
				<td><input type="text" name="correoelectronico" size="5" value="<%=rec.getString("correoelectronico")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Telefono </div></th>
				<td><input type="text" name="telefono" size="5" value="<%=rec.getString("telefono")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Consumo </div></th>
				<td><input type="text" name="consumo" size="5" value="<%=rec.getString("consumo")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Dimensiones </div></th>
				<td><input type="text" name="dimensiones" size="5" value="<%=rec.getString("dimensiones")%>"></td>
			</tr>
			</table> 
			<br>
		<input type="submit" value="Guardar" class="button-40" role="button">
		</form> 
		
		<% }
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
</body>
</html>