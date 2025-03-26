import java.util.ArrayList;
import java.util.List;
import java.util.Random;
class Perceptron {
    private List<Double> weights;
    private double learningRate = 0.1;
    private double threshold = new Random().nextDouble() * 2 - 1;
    public Perceptron(int attributeCount) {
        weights = new ArrayList<>();
        Random random = new Random();
        for (int i = 0; i < attributeCount; i++) {
            weights.add(random.nextDouble() * 2 - 1);
        }
        weights.add(threshold);
    }
    public double aktywacja(List<Double> inputs) {
        double sum = 0;
        List<Double> augmentedInputs = new ArrayList<>(inputs);
        augmentedInputs.add(-1.0);
        for (int i = 0; i < augmentedInputs.size(); i++) {
            sum += augmentedInputs.get(i) * weights.get(i);
        }
        return sum >= 0 ? 1 : 0;
    }
    public void adjustWeights(double result, double expected, List<Double> inputs) {
        List<Double> augmentedInputs = new ArrayList<>(inputs);
        augmentedInputs.add(-1.0);
        double error = expected - result;
        for (int i = 0; i < weights.size(); i++) {
            weights.set(i, weights.get(i) + learningRate * error * augmentedInputs.get(i));
        }
    }
}