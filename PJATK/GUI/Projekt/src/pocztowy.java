import java.util.Random;

public class pocztowy extends Wagon implements PolaczenieZelektycznoscia{
    private String nadawca;
    private int WagaTowaru;
    public pocztowy(){
        super();
        Random random = new Random();
        int x = random.nextInt(1000,6000);
        this.nadawca = "inny";
        this.WagaTowaru = x;
    }


    public static void PokazLadunek(){
        Random random = new Random();
        int x = random.nextInt(100);
        System.out.println(x + " Liczba listow");
        int y = random.nextInt(100);
        System.out.println(y + "Liczba paczek");
    }

    public static void czyDzilaSortownik() throws InterruptedException {
        Random random = new Random();
        boolean działa = true;
        int counter = 0;
        while (counter < 5) {
            int x = random.nextInt(20);
            System.out.println(x);
            if (x == 17 || x == 9) {
                działa = false;
                System.out.print(" Sortownik uległ awarii");
                break;
            }
            counter++;
            Thread.sleep(1000);
        }
        if (działa){
            System.out.println("DZIAŁA");
        }



    }

    @Override
    public String toString() {
        return "Wagon Pocztowy";
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu()+ WagaTowaru;
    }

    public String getNadawca() {
        return nadawca;
    }

    @Override
    public void PodłączenieDoElektycznosci() {

    }

}
