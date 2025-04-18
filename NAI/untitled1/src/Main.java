import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        List<Iris> training = wczytajZpliku("src/iris_training.txt");
        List<Iris> test = wczytajZpliku("src/iris_test.txt");

        int attributesCount = training.get(0).getConditionalAttributes().size();
        Perceptron perceptron = new Perceptron(attributesCount);

        int epochs = 5;
        while (epochs-- > 0)
            for (Iris iris : training) {
                double aktywacja = perceptron.aktywacja(iris.getConditionalAttributes());
                double expectedOutcome;
                if (iris.getDecisionAttribute().equals("Iris-setosa")) {
                    expectedOutcome = 1;
                } else {
                    expectedOutcome = 0;
                }
                perceptron.adjustWeights(aktywacja, expectedOutcome, iris.getConditionalAttributes());
            }

        int correctpredictions = 0;

        for (Iris iris : test) {
            double result = perceptron.aktywacja(iris.getConditionalAttributes());
            double expectedOutcome;
            if (iris.getDecisionAttribute().equals("Iris-setosa")) {
                expectedOutcome = 1;
            } else {
                expectedOutcome = 0;
            }
            if (result == expectedOutcome) {
                correctpredictions++;
            }
        }

        double accuracy = (double) correctpredictions / test.size() * 100;
        System.out.println("Ilość poprawnie zakfalifikowanych: " + correctpredictions + "/" + test.size());
        System.out.println("Wynik procentowy: " + accuracy + "%");

        Scanner scanner = new Scanner(System.in);
        System.out.println("Wprowadź atrybuty irysa muszą być odzielone spacjami ('exit' aby wyjść):");
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            if ("exit".equalsIgnoreCase(line))
                break;
            String[] parts = line.split(" ");
            List<Double> userInput = new ArrayList<>();
            for (String part : parts) {
                userInput.add(Double.parseDouble(part));
            }
            double classif = perceptron.aktywacja(userInput);
            System.out.println("Klasyfikacja: " + (classif == 1 ? "Iris-setosa" : "Inny Iris"));
            System.out.println("Aby kontynuować wprowadz kolejne atrybuty albo exit aby wyjsc");
        }
        scanner.close();
    }

    public static List<Iris> wczytajZpliku(String path) {
        List<Iris> irises = new ArrayList<>();
        File file = new File(path);
        Scanner scanner;
        try {
            scanner = new Scanner(file);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        while (scanner.hasNext()) {
            List<Double> attributes = new ArrayList<>();
            String line = scanner.nextLine();
            String[] tokens = line.split("\\s+");
            String type = "";
            for (String token : tokens) {
                if (token.contains(",") || token.contains(".")) {
                    attributes.add(Double.valueOf(token.replace(',', '.')));
                } else {
                    type = token.trim();
                }
            }
            Iris iris = new Iris(attributes, type);
            irises.add(iris);
        }
        scanner.close();
        return irises;
    }
}
