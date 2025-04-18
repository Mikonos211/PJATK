public class Observation {
    private String language;
    private final double[] attributes;

    public Observation(String language, String text) {
        this.language = language;
        this.attributes = countLetters(text);
    }

    private double[] countLetters(String text) {
        double[] attributes = new double[26];
        int totalLetters = 0;

        for (char letter : text.toCharArray()) {
            if (letter >= 'a' && letter <= 'z') {
                int index = letter - 'a';
                attributes[index]++;
                totalLetters++;
            }
        }

        for (int i = 0; i < attributes.length; i++) {
            attributes[i] /= totalLetters;
        }

        return attributes;
    }

    public String getLanguage() {
        return language;
    }

    public double[] getAttributes() {
        return attributes;
    }
}
