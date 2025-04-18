import java.util.Random;

public class naMaterialyWybuchowe extends TowarowyCiezki {
    private int WagaTowaruWybuch;
    private String Nadawca;

    private static String[] MaterialWybuchowy = {"TNT", "RDX ", "PETN", "HMTD"};

    public naMaterialyWybuchowe() {
        super();
        Random random = new Random();
        int x = random.nextInt(1000, 7432);
        this.WagaTowaruWybuch = x;
        this.Nadawca = "Aladyn";
    }

    public static void PrzewozonyMaterialWybuch(){
        Random random = new Random();
        int x = random.nextInt(10);
        System.out.println(MaterialWybuchowy[x]);
    }

    public static void Wybuch(){
        Random random = new Random();
        int x = random.nextInt(10);
        if(x == 0){
            System.out.println("BUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUM");
        }else{
            System.out.println("Jest bezpiecznie");
        }

    }

    @Override
    public String toString() {
        return "Wagon naMaterialyWybuchowe";
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu() + WagaTowaruWybuch;
    }

    @Override
    public String getNadawca() {
        return Nadawca;
    }

    public void setNadawca(String nadawca) {
        Nadawca = nadawca;
    }

}
