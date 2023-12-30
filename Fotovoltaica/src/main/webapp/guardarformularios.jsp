<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="bulma.css">
<meta charset="UTF-8">
<meta http-equiv = "refresh" content = "2; url = admin.jsp" />
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
		
		String primernombre = request.getParameter("primernombre");
		String segundonombre = request.getParameter("segundonombre");
		String primerapellido = request.getParameter("primerapellido");
		String segundoapellido = request.getParameter("segundoapellido");
		String direccion = request.getParameter("direccion");
		String correoelectronico = request.getParameter("correoelectronico");
		String telefono = request.getParameter("telefono");
		String consumo = request.getParameter("consumo");
		String dimensiones = request.getParameter("dimensiones");

		String sql = "UPDATE formulario " +
				"SET primernombre = '"+ primernombre + "' " +
				", segundonombre = '"+ segundonombre + "' " +
				", primerapellido = '"+ primerapellido + "' " +
				", segundonombre = '"+ segundonombre + "' " +
				", segundoapellido = '"+ segundoapellido + "' " +
				", direccion = '"+ direccion + "' " +
				", correoelectronico = '"+ correoelectronico + "' " +
				", telefono = '"+ telefono + "' " +
				", consumo = '"+ consumo + "' " +
				", dimensiones = '"+ dimensiones + "' " +
				" WHERE correoelectronico = '" + correoelectronico + "' ";
		
         s.execute(sql);
        
         out.println("El formulario ha sido guardado...");
	  		
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