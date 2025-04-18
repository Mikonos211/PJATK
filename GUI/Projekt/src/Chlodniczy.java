import java.util.Random;

public class Chlodniczy  extends towarowyPodstawowy{
    private int WagaTowaruChlod;
    private String Nadawca;

    private static String Towar;

    public Chlodniczy(){
        super();
        this.Nadawca = "Yoda";
        Random random = new Random();
        int x = random.nextInt(1000, 7432);
        this.WagaTowaruChlod = x;
    }

    public static void WyświetlTemperature(){
        Random random = new Random();
        int x = random.nextInt(50);
        System.out.println("-" + x);
    }

    public static void setTowar(String towar) {
        Towar = towar;
    }


    public void WyświetlTowarChlod(){
        String[] towar = {"Owoce Mrożone", "Warzywa Mrozone", "Chemikalia", "Kwiaty", "Leki", "Lod"};
        Random random = new Random();
        int x = random.nextInt(6);
        this.Towar = towar[x];
        System.out.println(towar[x]);
    }


    @Override
    public String toString() {
        return "Wagon bagazowy";
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu() + WagaTowaruChlod;
    }

    public String getNadawca() {
        return Nadawca;
    }
}
