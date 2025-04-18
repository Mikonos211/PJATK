import java.util.Random;

public class restauracyjny extends Wagon implements PolaczenieZelektycznoscia{
    private int WagaTowaruRes;

    private String nadawca;

    public restauracyjny(){
        super();
        Random random = new Random();
        int x = random.nextInt(1000, 5987);
        this.nadawca =  "nie wiem kto";
        this.WagaTowaruRes = x;
    }

    public static void PokazMenu() {
        String[] menu = {" Stek", " Dorsz", " Kaczka", " Skrzydelka Kurczaka", " Pstrąg", " Nalesniki"};
        for (int i = 0; i < menu.length; i++) {
            System.out.print(menu[i] + ", ");
        }
    }


    public static void DanieDnia(){
        Random random= new Random();
        String[] Danie = {" Krem z dyni ", " Pieczen", " Spaghetti", " Krewetki", "Pierogi", " Pad thai" };
        int x  = random.nextInt(Danie.length);
        System.out.println("Danie dnia to:" + Danie[x]);

    }

    @Override
    public String toString() {
        return "Wagon restauracyjny";
    }

    public String getNadawca() {
        return nadawca;
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu()+ WagaTowaruRes;
    }

    @Override
    public void PodłączenieDoElektycznosci() {

    }
}
