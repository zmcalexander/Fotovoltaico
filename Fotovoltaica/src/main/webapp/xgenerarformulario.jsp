<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid text-center">

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<form method="post">

    <table border="0">
        <tr>
            <td>user ID</td>
            <td>Birthday</td>
            <td>Gender</td>
            <td>First Name</td>
            <td>Last Name</td>
        </tr>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/eyetracker";
                String username="root";
                String password="root";
                String query="select * from user";
                Connection conn=DriverManager.getConnection(url, username, password);
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(query);
                while(rs.next())
                {

        %>
        <tr><td><%=rs.getInt("userID") %></td></tr>
        <tr><td><%=rs.getDate("dob") %></td></tr>
        <tr><td><%=rs.getString("gender") %></td></tr>
        <tr><td><%=rs.getString("firstName") %></td></tr>
        <tr><td><%=rs.getString("lastName") %></td></tr>

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
</div>
</body>
</html>