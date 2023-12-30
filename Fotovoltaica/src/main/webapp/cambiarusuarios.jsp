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
		
		String correoelec = request.getParameter("correoelec");

		String sql = "SELECT * FROM  usuarios WHERE correoelec = '" + correoelec + "'  ";
		
		ResultSet rec = s.executeQuery(sql);
		if(rec != null) {
			rec.next();
		%>
	<form name="frmUpdate" method="post" action="guardarusuarios.jsp?correoelec=<%=rec.getString("correoelec")%>">	
		<h1>Cambiar Datos de Usuarios</h1>
			<table width="428" border="1">	
			<tr>
				<td><div align="left">Primer Nombre </div></td>
				<td><input type="text" name="primernombre" size="20" value="<%=rec.getString("primernombre")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Segundo Nombre </div></td>
				<td><input type="text" name="segundonombre" size="20" value="<%=rec.getString("segundonombre")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Primer Apellido </div></td>
				<td><input type="text" name="primerapellido" size="20" value="<%=rec.getString("primerapellido")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Segundo Apellido </div></td>
				<td><input type="text" name="segundoapellido" size="20" value="<%=rec.getString("segundoapellido")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Direccion </div></td>
				<td><input type="text" name="direccion" size="100" value="<%=rec.getString("direccion")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Correo Electronico </div></td>
				<td><input type="text" name="correoelec" size="50" value="<%=rec.getString("correoelec")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Ciudad </div></td>
				<td><input type="text" name="ciudad" size="20" value="<%=rec.getString("ciudad")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Pais </div></td>
				<td><input type="text" name="pais" size="20" value="<%=rec.getString("pais")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Codigo de Autorization </div></td>
				<td><input type="text" name="codigoauth" size="20" value="<%=rec.getString("codigoauth")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Telefono </div></td>
				<td><input type="text" name="telefono" size="20" value="<%=rec.getString("telefono")%>"></td>
			</tr>
			<tr>
				<td><div align="left">Contrasena </div></th></td>
				<td><input type="text" name="contrasena" size="20" value="<%=rec.getString("contrasena")%>"></td>
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