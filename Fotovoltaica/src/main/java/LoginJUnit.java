import static org.junit.jupiter.api.Assertions.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;

class LoginJUnit {

	// LoginBean
	void assertTrueLoginBean() 
	{
		try 
		{
			LoginBean lb = new LoginBean();
			lb.setUsername("user");
			lb.getUsername();
			lb.setPassword("password");
			lb.getPassword();
		} catch (Exception e) 
		{
			System.out.println("loginbean failed.");
		}
	}
	
	// LoginServlet
	void assertTrueLoginServlet() 
	{
		try 
		{
			LoginServlet ls = new LoginServlet();
			ls.init();
		} catch (Exception e) 
		{
			System.out.println("loginservlet failed.");
		}
	}
	
	// LoginServlet
	void assertTrueLoginDAO() 
	{
		try 
		{
			LoginBean lb = new LoginBean();
			LoginDao dao = new LoginDao();
			dao.validate(lb);
		} catch (Exception e) 
		{
			System.out.println("logindao failed.");
		}
	}
	
	
	
}



