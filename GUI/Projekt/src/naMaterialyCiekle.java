import java.util.Random;

public class naMaterialyCiekle extends towarowyPodstawowy{
    private int WagaTowaruCiekle;
    private String nadawca;

    private static String[] nazwaMaterialuCiek = {"ropy naftowej", "benzyny", "olej napędowy", "etanolu", "metanolu", "kwasu siarkowego", "kwasu solnego", "amoniaku", "chloru", "kwasu azotowego"};

    public naMaterialyCiekle(){
        super();
        Random random = new Random();
        int x = random.nextInt(1000, 6575);
        this.nadawca = "MACIEK";
        this.WagaTowaruCiekle = x;
    }

    public static void PierwszaMetoda(){
        Random random = new Random();
        int x = random.nextInt(10);
        System.out.print(nazwaMaterialuCiek[x]);
    }
    public static void WyświetlIloścTowaru(){
        Random random = new Random();
        int x = random.nextInt(1000)+1;
        System.out.print("W Wagonie znajduje się " + x + " listów ");
        PierwszaMetoda();
        System.out.println();
    }

    @Override
    public String toString() {
        return "Wagon naMaterialyCiekle";
    }


    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu() + WagaTowaruCiekle;
    }

    public String getNadawca() {
        return nadawca;
    }

    public void setNadawca(String nadawca) {
        this.nadawca = nadawca;
    }
}
