import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {
    public static ArrayList<Observation> test, training;
    public static HashMap<String, Perceptron> identifiers;

    public static void main(String[] args) {
        test = Service.parse("data/test");
        training = Service.parse("data/training");
        identifiers = setIdentifiers();

        for (int i = 0; i < 10000; i++) {
            for (Observation trainingObs : training) {
                for (Map.Entry<String, Perceptron> entry : identifiers.entrySet()) {
                    entry.getValue().learn(trainingObs, trainingObs.getLanguage(), entry.getKey());
                }
            }
        }

        Scanner scanner = new Scanner(System.in);
        String inputText;

        while (true) {
            System.out.println("Enter text (type 'end' to finish):");
            inputText = scanner.nextLine();

            if (inputText.equalsIgnoreCase("end"))
                break;

            Observation observation = new Observation("Unknown", inputText);
            HashMap<String, Double> results = detectLanguageWithConfidence(observation);

            double maxConfidence = Double.MIN_VALUE;
            String detectedLanguage = "Unknown";

            for (Map.Entry<String, Double> entry : results.entrySet()) {
                if (entry.getValue() > maxConfidence) {
                    maxConfidence = entry.getValue();
                    detectedLanguage = entry.getKey();
                }
            }

            System.out.println("Detected language: " + detectedLanguage + ", Confidence: " + maxConfidence + "%");
        }
    }

    private static HashMap<String, Double> detectLanguageWithConfidence(Observation observation) {
        HashMap<String, Double> results = new HashMap<>();

        for (Map.Entry<String, Perceptron> entry : identifiers.entrySet()) {
            double confidence = entry.getValue().getConfidence(observation) * 100;
            results.put(entry.getKey(), confidence);
        }

        return results;
    }

    private static HashMap<String, Perceptron> setIdentifiers() {
        HashMap<String, Perceptron> identifiers = new HashMap<>();
        for (Observation observation : training)
            identifiers.put(observation.getLanguage(), new Perceptron());
        return identifiers;
    }
}
