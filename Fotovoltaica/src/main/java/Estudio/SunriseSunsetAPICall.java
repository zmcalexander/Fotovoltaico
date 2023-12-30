package Estudio;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class SunriseSunsetAPICall {
	
	public String SunriseSunsetAPI(String lat, String lon) {
		
		StringBuilder informationString = null;
		LocalDate dateObj = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date = dateObj.format(formatter);
		String latitude = lat;
		String longitude = lon;
		  // Set up the endpoint with the required latitude, longitude, and date
        String apiUrl = "https://api.sunrise-sunset.org/json?lat=" + latitude + "&lng=" + longitude + "&date=" + date;

        try {
            // Create a URL object
            URL url = new URL(apiUrl);

            // Open a connection
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            // Check if the request was successful
            int responseCode = conn.getResponseCode();
            if(responseCode != 200) {
                throw new RuntimeException("HttpResponseCode: " + responseCode);
            } else {
            	informationString = new StringBuilder();
                // Use Scanner to read the response
                Scanner scanner = new Scanner(url.openStream());

                // Write all the JSON data into a string using a scanner
                while (scanner.hasNext()) {
                    informationString.append(scanner.nextLine());
                }

                // Close the scanner
                scanner.close();

                // Print the data
                System.out.println(informationString.toString());
                
           

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
		return informationString.toString();
	}

   
}
