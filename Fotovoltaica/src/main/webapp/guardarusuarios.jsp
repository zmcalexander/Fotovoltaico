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
		
		String correoelec = request.getParameter("correoelec");
		String codigoauth = request.getParameter("codigoauth");

		
		
		String sql = "UPDATE usuarios " +
				"SET codigoauth = '"+ codigoauth + "' " +
				" WHERE correoelec = '" + correoelec + "' ";
         s.execute(sql);
        
         out.println("Los cambios se han guardado correctamente...");
	  		
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