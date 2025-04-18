import java.util.Random;

public class naMaterialyGazowe extends towarowyPodstawowy{
    private int WagaTowaruGaz;
    private String Nadawca;

    private static String[] nazwaGazu = {"tlen", "wodór", "azot", "dwutlenek węgla", "argon", "neon", "hel", "krypton", "ksenon", "radon"};

    public naMaterialyGazowe(){
        super();
        Random random = new Random();
        int x = random.nextInt(1000, 3274);
        this.Nadawca = "Rosja";
        this.WagaTowaruGaz = x;
    }


    public static void PrzewozonyGaz(){
        Random random = new Random();
        int x = random.nextInt(10);
        System.out.println(nazwaGazu[x]);
    }

    public static void SprawdzCzyJestWyciek() throws InterruptedException {
        Random random = new Random();
        int couter = 0;
        while (couter == 5) {
            int x = random.nextInt(10);
            if (x == 5) {
                System.out.println("Wycieka");
            }
            couter++;
            Thread.sleep(2000);
        }
    }

    public int getWagaTowaruGaz() {
        return WagaTowaruGaz;
    }

    public String getNadawca() {
        return Nadawca;
    }

    public void setNadawca(String nadawca) {
        Nadawca = nadawca;
    }

    @Override
    public String toString() {
        return "Wagon na materialy gazowe";
    }
}
