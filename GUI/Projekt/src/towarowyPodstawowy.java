import java.util.Random;

public class towarowyPodstawowy extends Wagon{
    private String Towar;
    private int Wagatowaru;
    private int WagaTowarowyPod;

    public towarowyPodstawowy() {
        Random random = new Random();
        int x = random.nextInt(6);
        int y = random.nextInt(1000, 3000);
        this.Wagatowaru = y;
        this.WagaTowarowyPod = 35000;
    }

    public void WyświetlTowarPod(){
        String[] towar = {"Odzież", "Elektronika", "Książki", "Kosmetyki", "Drobiazgi", "Zabawki"};
        Random random = new Random();
        int x = random.nextInt(5);
        this.Towar = towar[x];
        System.out.println(towar[x]);
    }
    public static void DrugaMetoda(){

    }

    @Override
    public String toString() {
        return "Wagon TowarowyPodstawowy";
    }

    public int getWagaTowarowyPod() {
        return WagaTowarowyPod + Wagatowaru;
    }



    public String getTowar() {
        return Towar;
    }
}
