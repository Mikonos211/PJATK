import java.util.Random;

public class Perceptron {
    private double alpha;
    private double theta;
    private final double[] weights;

    public Perceptron() {
        Random random = new Random();
        alpha = random.nextDouble();
        theta = random.nextDouble();
        weights = new double[26];
        fillRandomWeights();
    }

    private void fillRandomWeights() {
        Random random = new Random();
        for (int i = 0; i < weights.length; i++) {
            weights[i] = random.nextDouble() * 2 - 1;
        }
    }

    public int evaluate(Observation observation) {
        double net = theta;

        double[] attributes = observation.getAttributes();
        for (int i = 0; i < attributes.length; i++) {
            net += attributes[i] * weights[i];
        }

        if (net >= 0) {
            return 1;
        } else {
            return 0;
        }
    }


    public void learn(Observation observation, String writtenLabel, String actualLabel) {
        int d;
        if (writtenLabel.equals(actualLabel)) {
            d = 1;
        } else {
            d = 0;
        }
        int y = evaluate(observation);
        int error = d - y;

        double[] attributes = observation.getAttributes();
        for (int i = 0; i < weights.length; i++) {
            weights[i] += alpha * error * attributes[i];
        }

        theta += error * alpha;
    }

    public double getConfidence(Observation observation) {
        double net = theta;

        double[] attributes = observation.getAttributes();
        for (int i = 0; i < attributes.length; i++) {
            net += attributes[i] * weights[i];
        }

        return  1 / (1 + Math.exp(-net));
    }


}
