package Estudio;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Scanner;
import org.json.JSONObject;

public class GeocodeMapsCoAPICall {
	
	private double[] coordinates = new double[2];

    public double[] geocodeAddress(String address) {
        try {
            // Prepare the address by encoding it to be used as a query parameter
            String encodedAddress = URLEncoder.encode(address, "UTF-8");

            // The API endpoint for the forward geocoding
            String apiUrl = "https://geocode.maps.co/search?q=" + encodedAddress;

            // Create a URL object
            URL url = new URL(apiUrl);

            // Open a connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Set the request method to GET
            connection.setRequestMethod("GET");

            // Connect to the API service
            connection.connect();

            // Check if the request was successful
            int responseCode = connection.getResponseCode();
            if (responseCode != HttpURLConnection.HTTP_OK) {
                System.out.println("Request failed with response code " + responseCode);
                return coordinates;
            }

            // Read the response
            Scanner scanner = new Scanner(url.openStream());
            StringBuilder response = new StringBuilder();
            while (scanner.hasNext()) {
                response.append(scanner.nextLine());
            }
            scanner.close();

            // Convert the response to a JSON object
            JSONObject jsonObject = new JSONObject("{results:" + response.toString() + "}");
            
            // Assuming the first result is the most relevant
            JSONObject result = jsonObject.getJSONArray("results").getJSONObject(0);
            
            // Extract latitude and longitude from the JSON object
            double latitude = result.getDouble("lat");
            double longitude = result.getDouble("lon");
            
 
            
            coordinates[0] = latitude;
            coordinates[1] = longitude;

            
            // Print out the coordinates
            System.out.println("Latitude: " + latitude);
            System.out.println("Longitude: " + longitude);

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return coordinates;
    }
}
