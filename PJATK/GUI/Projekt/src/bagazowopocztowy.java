import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class bagazowopocztowy extends Wagon{
    private static int MaksWaga = 100;
    private static int wagaBierzca;

    private static ArrayList<Bagaze> listaBagazy = new ArrayList<>();

    private int WagaBag;

    private String nadawca;

    public bagazowopocztowy(){
        super();
        this.nadawca = "jakis";
    }

    public  void DodajUsunBagaz() {
        while (wagaBierzca < MaksWaga){
            Scanner scanner = new Scanner(System.in);
            System.out.println("Aby dodać bagaz wpisz 1 , Wpisz 2 aby usunac bagaz , wpisz 0 aby przerwac");
            int x = scanner.nextInt();
            if(x == 1){
                Bagaze bagaze = new Bagaze();
                listaBagazy.add(bagaze);
                wagaBierzca += bagaze.getWaga();
                setWagaWagonu(bagaze.getWaga());

            }else if(x == 2) {
                if (listaBagazy.size() == 0) {
                    System.out.println("Brak Bagazy nie ma co usuwać");
                } else {
                    System.out.println("Ktory bagaz usunac? wpisz jego numer zaczynając od 1 do " + listaBagazy.size());
                    int nrBagazu = scanner.nextInt();
                    if (nrBagazu < 1 || nrBagazu > listaBagazy.size()) {
                        System.out.println("Nie bagarzu o takim numerze");
                    } else {
                        Bagaze bagaze = listaBagazy.get(nrBagazu - 1);
                        listaBagazy.remove(bagaze);
                        wagaBierzca -= bagaze.getWaga();
                        System.out.println("bagaz usuniento");
                    }
                }
            }
            else if (x == 0){
                System.out.println("Koniec dodawania Bagarzu");
                break;
            }
            else {
                System.out.println("Stosuj sie do instrukcji");
            }
        }
    }

    public static void WypelnijBagarzeAutomatycznie(){
        Random random = new Random();
        int LiczbaBagarzy = random.nextInt(20)+1;
        int couter = 0;
        while (couter < LiczbaBagarzy){
            Bagaze bagaze = new Bagaze();
            listaBagazy.add(bagaze);
            couter++;
        }
    }

    public static void PokazZawartosc(){
        for (Bagaze bagaze : listaBagazy) {
            System.out.println(bagaze);
        }
    }

    @Override
    public String toString() {
        return "Wagon Bagazowy";
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu();
    }

    public String getNadawca() {
        return nadawca;
    }
}
