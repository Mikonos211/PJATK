import java.util.Random;

public class naCiekleMaterialyToksyczne extends TowarowyCiezki implements CechywagonuCiekle{
    private int WagaTowaruTox;
    private String Nadawca;


    public naCiekleMaterialyToksyczne() {
        super();
        Random random = new Random();
        int x = random.nextInt(1000, 4324);
        this.Nadawca = "Pjatk";
        this.WagaTowaruTox = x;

    }

    public static void WyświetlPersonelWagonu(){
        String[] imiona = {"Adam", "Maria", "Tomasz", "Katarzyna", "Piotr", "Magdalena", "Marek", "Anna", "Jan", "Karolina"};
        Random random = new Random();
        int x = random.nextInt(4)+1;
        int counter = 0;
        while (counter < x){
            int y =random.nextInt(10);
            System.out.println(imiona[y]);
            counter++;
        }
    }

    public static void PoziomToksycznosci(){
        Random random = new Random();
        String[] ToxicLvL = {"Słaby", "Sredni", "Mocny", "Smiertelny"};
        int x = random.nextInt(4);
        switch (x){
            case 0:
                System.out.println(ToxicLvL[0]);
                System.out.println("Można pić");
                break;
            case 1:
                System.out.println(ToxicLvL[1]);
                System.out.println("Troszke kwaśne");
                break;
            case 2:
                System.out.println(ToxicLvL[2]);
                System.out.println("Chyba bede rzy....");
                break;
            case 3:
                System.out.println(ToxicLvL[3]);
                System.out.println("MACIEK NIE PIJ TEGO!");
                break;
        }

    }

    @Override
    public String toString() {
        return "Wagon naCiekleMaterialyToksyczne";
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu() + WagaTowaruTox;
    }

    @Override
    public String getNadawca() {
        return Nadawca;
    }

    public void setNadawca(String nadawca) {
        Nadawca = nadawca;
    }
    @Override
    public void PierwszaMetoda() {

    }

    @Override
    public void WyświetlIloścTowaru() {

    }
}
