import java.util.Random;

public class Bagaze {
    private int Number;
    private int Waga;
    private static int counter = 1;


    public Bagaze(){
        Random random = new Random();
        Number = counter++;
        this.Waga = random.nextInt(15)+1;
    }

    public int getNumber() {
        return Number;
    }

    public int getWaga() {
        return Waga;
    }

    @Override
    public String toString() {
        return " Waga Bagazu: " + Waga +
                "\n"  + " Numer: " +Number;
    }
}
