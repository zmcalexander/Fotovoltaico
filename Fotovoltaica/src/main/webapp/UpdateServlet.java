import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1 L;
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    try {
      String correoelec = request.getParameter("correoelec");

      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uml", "root", "m24p12P1");

      PreparedStatement ps = con.prepareStatement("update usuarios set codigoauth =? where correoelec=?");
      ps.setString(1, Math.random());
      ps.setString(2, correoelec);

      int i = ps.executeUpdate();
      if (i > 0) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('User updated successfully');");
        out.println("location='index.jsp';");
        out.println("</script>");
      } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('User update failed');");
        out.println("location='edit.jsp?id=" + id + "';");
        out.println("</script>");
      }

      con.close();
    } catch (Exception e) {
      out.println("<script type=\"text/javascript\">");
      out.println("alert('An error occurred: " +
        e.getMessage() + "');");
      out.println("location='edit.jsp?id=" + request.getParameter("id") + "';");
      out.println("</script>");
    }
    out.close();
  }
}