<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous" />
<style type="text/css">
table {
	border-collapse: collapse;
    font-family: Tahoma, Geneva, sans-serif;
}
table td {
	padding: 15px;
}
table thead td {
	background-color: #54585d;
	color: #ffffff;
	font-weight: bold;
	font-size: 13px;
	border: 1px solid #54585d;
}
table tbody td {
	color: #636363;
	border: 1px solid #dddfe1;
}
table tbody tr {
	background-color: #f9fafb;
}
table tbody tr:nth-child(odd) {
	background-color: #ffffff;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<h1>Gestión de Usuarios</h1>

<form method="post">

    <table border="2">
        <tr>
            <td>Primer Nombre</td>
            <td>Segundo Nombre</td>
            <td>Primer Apellido</td>
			<td>Segundo Apellido</td>
			<td>Correo Electronico</td>
			<td>Telefono</td>
			<td>Direccion</td>
			<td>Ciudad</td>
			<td>Pais</td>

        </tr>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/uml";
                String username="root";
                String password="m24p12P1";
                String query="select * from usuarios";
                Connection conn=DriverManager.getConnection(url, username, password);
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(query);
                while(rs.next())
                {

        %>
     
        <tr>
        <td><%=rs.getString("primernombre") %></td>
        <td><%=rs.getString("segundonombre") %></td>
        <td><%=rs.getString("primerapellido") %></td>
        <td><%=rs.getString("segundoapellido") %></td>
        <td><%=rs.getString("correoelec") %></td>
        <td><%=rs.getString("telefono") %></td>
        <td><%=rs.getString("direccion") %></td>
		<td><%=rs.getString("ciudad") %></td>		
		<td><%=rs.getString("pais") %></td>
        </tr>


        <%

            }
        %>
    </table>
    <%
            rs.close();
            stmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    %>
</form>
</body>
</html>