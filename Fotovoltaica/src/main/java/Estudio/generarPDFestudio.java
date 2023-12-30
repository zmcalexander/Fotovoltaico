package Estudio;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.itextpdf.text.*;

@WebServlet("/generarPDFestudio")
public class generarPDFestudio extends HttpServlet {
	
	private String correo = "";
	
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	public String getCorreo() {
		return this.correo;
	}
	
	protected void doPost(HttpServletRequest request,
	HttpServletResponse response) throws ServletException, IOException {
	         
	        // read form fields
	        String correo = request.getParameter("correoelectronico");
	        
	
	}
	
	public void generarEstudio(String correo) throws SQLException, DocumentException, FileNotFoundException {
		
		String path = "C:\\Users\\zmcal\\OneDrive\\Desktop";
		
		Document document = new Document();
		
		PdfWriter.getInstance(document, new FileOutputStream(path + "/estudio.pdf"));
		
		document.open();
		
		Paragraph para = new Paragraph("This is a test feasibility study");
		
		document.add(para);
	
		DBConnection obJDBConnection = new DBConnection();
		java.sql.Connection connection = obJDBConnection.getConnection();
		java.sql.PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "select * from formulario where correoelectronico = ? limit 1";
		ps = connection.prepareStatement(query);
	    ps.setString(1, correo);
	    
		rs = ps.executeQuery();
		/*
	    GeocodeMapsCoAPICall geo = new GeocodeMapsCoAPICall();
		double[] coordinates = new double[2];
		String sunResults;
		coordinates = geo.geocodeAddress(rs.getString("direccion"));
		SunriseSunsetAPICall sun = new SunriseSunsetAPICall();
		sunResults = sun.SunriseSunsetAPI(Double.toString(coordinates[0]), Double.toString(coordinates[1]));
		*/
		
		while (rs.next()) {
		    GeocodeMapsCoAPICall geo = new GeocodeMapsCoAPICall();
			double[] coordinates = new double[2];
			String sunResults;
			coordinates = geo.geocodeAddress(rs.getString("direccion"));
			SunriseSunsetAPICall sun = new SunriseSunsetAPICall();
			sunResults = sun.SunriseSunsetAPI(Double.toString(coordinates[0]), Double.toString(coordinates[1]));
			String printSunResults = MapToStringConverter.mapToString((JsonToMapConverter.jsonToMap(sunResults)));
			Paragraph para1 = new Paragraph("Primer Nombre: " + rs.getString("primernombre") + "\r\n" + 
			"Segundo Nombre: " + rs.getString("segundonombre") + "\r\n" + 
			"Primer Apellido: " + rs.getString("primerapellido") + "\r\n" + 
			"Segundo Apellido: " + rs.getString("segundoapellido") + "\r\n" + 
			"Dirección: " + rs.getString("direccion") + "\r\n" + 
			"Correo Electrónico: " + rs.getString("correoelectronico") + "\r\n" + 
			"Consumo: " + rs.getString("consumo") + "\r\n" + 
			"Dimensiones: " + rs.getString("dimensiones") + "\r\n" + 
			"Latitud: " + coordinates[0] + "\r\n" +  
			"Longitud: " + coordinates[1] + "\r\n" + 
			"Resultados: " + printSunResults + "\r\n" + 
			"Factibilidad: " + ": Verificado" + "\r\n" + 
			"Paneles Solares: " + Math.floor(Integer.parseInt(rs.getString("consumo")) / 300)
					);
			document.add(para1);
			document.add(new Paragraph(" "));
		}
		
		document.close();
		
	//	EmailAttachment email = new EmailAttachment();
	//	email.enviarCorreo();
	}
	
	
}



