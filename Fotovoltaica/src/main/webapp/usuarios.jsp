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
<h1>Gesti�n de Usuarios</h1>
	<%
	Connection connect = null;
	Statement s = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/uml" +
				"?user=root&password=m24p12P1");
		
		s = connect.createStatement();
		
		String sql = "SELECT * FROM  usuarios ORDER BY primerapellido ASC";

		ResultSet rec = s.executeQuery(sql);
		%>
		<table width="600" border="1">
		  <tr>
		    <th width="91"> <div align="center">Primer Nombre </div></th>
		    <th width="98"> <div align="center">Segundo Nombre </div></th>
		    <th width="198"> <div align="center">Primer Apellido </div></th>
		    <th width="97"> <div align="center">Segundo Apellido</div></th>
		    <th width="59"> <div align="center">Direccion </div></th>
		    <th width="71"> <div align="center">Telefono </div></th>
		    <th width="71"> <div align="center">Correo Electronico </div></th>
		    <th width="59"> <div align="center">Ciudad </div></th>
		    <th width="71"> <div align="center">Pais </div></th>
		    <th width="71"> <div align="center">Codigo de Autorizacion </div></th>
		    <th width="71"> <div align="center">Contrasena </div></th>

		  </tr>	
			<%while((rec!=null) && (rec.next())) { %>
				  <tr>
				    <td><div align="center"><%=rec.getString("primernombre")%></div></td>
				    <td><%=rec.getString("segundonombre")%></td>
				    <td><%=rec.getString("primerapellido")%></td>
				    <td><div align="center"><%=rec.getString("segundoapellido")%></div></td>
				    <td align="right"><%=rec.getString("direccion")%></td>
				    <td align="right"><%=rec.getString("telefono")%></td>
				    <td align="right"><%=rec.getString("correoelec")%></td>
				    <td align="right"><%=rec.getString("ciudad")%></td>
				    <td align="right"><%=rec.getString("pais")%></td>
				    <td align="right"><%=rec.getString("codigoauth")%></td>
				    <td align="right"><%=rec.getString("contrasena")%></td>
				    <td align="center"> <a href="cambiarusuarios.jsp?correoelec=<%=rec.getString("correoelec")%>">Cambiar</a></td>
				  </tr>
	       	<%}%>
	  	</table>      
	    <%	
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