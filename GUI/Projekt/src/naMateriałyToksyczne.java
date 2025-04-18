import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class naMateriałyToksyczne extends TowarowyCiezki{
    private int WagaTowaruToks;
    private String Nadawca;

    private static String[] Toksyna = {"Rtęć", "Kadm", "Ołów", "Arsen", "Kyanowodór", "Siarkowodór", "Fosgen", "Chlor", "Fosfor", "Związek arsenu z kwasem octowym"};

    public naMateriałyToksyczne(){
        super();
        Random random = new Random();
        int x = random.nextInt(1000, 9021);
        this.WagaTowaruToks = x;
        this.Nadawca = "Moja była";
    }

    public static void PrzewozonaToksyna() {
        Random random = new Random();
        int x = random.nextInt(10);
        System.out.println(Toksyna[x]);
    }

    public static void PoziomToksycznosci(){
        Random random = new Random();
        int x = random.nextInt(3);
        List<String> LvL = new ArrayList<>();
        LvL.add("Niski");
        LvL.add("Średni");
        LvL.add("Wysoki");
        LvL.get(x);
    }

    @Override
    public String toString() {
        return "Wagon naMateriałyToksyczne";
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu()+ WagaTowaruToks;
    }

    @Override
    public String getNadawca() {
        return Nadawca;
    }

    public void setNadawca(String nadawca) {
        Nadawca = nadawca;
    }
}
