package Estudio;

import org.json.JSONObject;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

public class JsonToMapConverter {

    public static Map<String, String> jsonToMap(String jsonStr) {
        Map<String, String> resultMap = new HashMap<>();
        
        try {
            JSONObject json = new JSONObject(jsonStr);
            JSONObject results = json.getJSONObject("results");

            Iterator<String> keys = results.keys();

            while(keys.hasNext()) {
                String key = keys.next();
                String value = results.getString(key);
                resultMap.put(key, value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resultMap;
    }
    
    
    public static void printMap(Map<String, String> resultMap) {
        // Print the map to see the results
        for (Map.Entry<String, String> entry : resultMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
    
    
    public static void main(String[] args) {
        String jsonStr = "{\"results\":{\"sunrise\":\"11:35:21 AM\",\"sunset\":\"10:34:36 PM\",\"solar_noon\":\"5:04:59 PM\",\"day_length\":\"10:59:15\",\"civil_twilight_begin\":\"11:12:28 AM\",\"civil_twilight_end\":\"10:57:29 PM\",\"nautical_twilight_begin\":\"10:44:49 AM\",\"nautical_twilight_end\":\"11:25:08 PM\",\"astronomical_twilight_begin\":\"10:17:29 AM\",\"astronomical_twilight_end\":\"11:52:28 PM\"},\"status\":\"OK\"}";
        
        Map<String, String> resultMap = jsonToMap(jsonStr);
        
        // Print the map to see the results
        for (Map.Entry<String, String> entry : resultMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}