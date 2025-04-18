import java.util.List;
class Iris {
    private List<Double> conditionalAttributes;
    private String decisionAttribute;
    public Iris(List<Double> conditionalAttributes, String decisionAttribute) {
        this.conditionalAttributes = conditionalAttributes;
        this.decisionAttribute = decisionAttribute;
    }
    public List<Double> getConditionalAttributes() {
        return conditionalAttributes;
    }

    public String getDecisionAttribute() {
        return decisionAttribute;
    }

    @Override
    public String toString() {
        return "IrisFlower{" +
                "conditionalAttributes=" + conditionalAttributes +
                ", decisionAttribute='" + decisionAttribute + '\'' +
                '}';
    }
}