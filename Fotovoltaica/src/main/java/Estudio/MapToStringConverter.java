package Estudio;
import java.util.Map;

public class MapToStringConverter {

    public static String mapToString(Map<String, String> map) {
        StringBuilder result = new StringBuilder();

        for (Map.Entry<String, String> entry : map.entrySet()) {
            result.append(entry.getKey())
                  .append(": ")
                  .append(entry.getValue())
                  .append("\n");
        }

        return result.toString();
    }

    public static void main(String[] args) {
        // Sample map
        Map<String, String> sampleMap = Map.of(
                "Key1", "Value1",
                "Key2", "Value2",
                "Key3", "Value3"
        );

        // Convert map to string
        String resultString = mapToString(sampleMap);

        // Print the result
        System.out.println(resultString);
    }
}