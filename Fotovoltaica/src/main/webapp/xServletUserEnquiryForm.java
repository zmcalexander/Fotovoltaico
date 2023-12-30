import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletUserEnquiryForm extends HttpServlet{
  public void init(ServletConfig config) throws ServletException{
  super.init(config);
  }
  /**Process the HTTP Get request*/
  public void doPost(HttpServletRequest req, 
  HttpServletResponse res) throws ServletException,
  IOException{
  String connectionURL = "jdbc:mysql://localhost:3306/uml?allowPublicKeyRetrieval=true&useSSL=false";
  Connection connection=null;
  ResultSet rs;
  res.setContentType("text/html");
  PrintWriter out = res.getWriter();
  //get the variables entered in the form
  String primernombre = req.getParameter("primernombre");
  String segundonombre = req.getParameter("segundonombre");
  String primerapellido = req.getParameter("primerapellido");
  String segundoapellido = req.getParameter("segundoapellido");
  String direccion = req.getParameter("direccion");
  String correoelectronico = req.getParameter("correoelectronico");
  String telefono = req.getParameter("telefono");
  String consumo = req.getParameter("consumo");
  String dimensiones = req.getParameter("dimensiones"); 
  try {
  // Load the database driver
  Class.forName("com.mysql.jdbc.Driver");
  // Get a Connection to the database
  connection = DriverManager.getConnection
  (connectionURL, "root", "m24p12P1"); 
  //Add the data into the database
  String sql = 
  "insert into formulario values (?,?,?,?,?,?,?,?,?)";
  PreparedStatement pst = 
  connection.prepareStatement(sql);
  pst.setString(1, primernombre);
  pst.setString(2, segundonombre);
  pst.setString(3, primerapellido);
  pst.setString(4, segundoapellido);
  pst.setString(5, direccion);
  pst.setString(6, correoelectronico);
  pst.setString(7, telefono);
  pst.setString(8, consumo);
  pst.setString(9, dimensiones);
  int numRowsChanged = pst.executeUpdate();
  // show that the new account has been created
  out.println(" Hello : ");
  out.println(" '"+primernombre+"'");
  pst.close();
  }
  catch(ClassNotFoundException e){
  out.println("Couldn't load database driver: " 
  + e.getMessage());
  }
  catch(SQLException e){
  out.println("SQLException caught: " 
  + e.getMessage());
  }
  catch (Exception e){
  out.println(e);
  }
  finally {
  // Always close the database connection.
  try {
  if (connection != null) connection.close();
  }
  catch (SQLException ignored){
  out.println(ignored);
  }
  }
  }
}