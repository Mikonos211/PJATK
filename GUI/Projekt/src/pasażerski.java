import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class pasażerski extends Wagon  implements  PolaczenieZelektycznoscia{
    private static int maksP = 72;
    private static int aktualnaLiczbaOsob;
    private static ArrayList<Pasazer> ListaPasazerow = new ArrayList<>();


    public String nadawca;

    public pasażerski(){
        super();
        this.nadawca = "ktos";
    }



    public void WypelnijWagonRecznie() {
        Scanner scanner = new Scanner(System.in);
        while (aktualnaLiczbaOsob <= maksP) {
            System.out.println("Aby dodać pasazerow wpisz 1, aby ich usunac wpisz 2, aby zakonczyc proces wpisz 0");
            int x = scanner.nextInt();
            if (x == 1) {
                System.out.println("jaka ilosc pasazerow dodac?");
                int LiczbaPasazerow = scanner.nextInt();
                int counter = 0;
                while (counter < LiczbaPasazerow) {
                    Pasazer pasazer = new Pasazer();
                    ListaPasazerow.add(pasazer);
                    counter++;
                    setWagaWagonu(pasazer.getWagaPasazera());
                }
                aktualnaLiczbaOsob += LiczbaPasazerow;
            } else if (x == 2) {
                System.out.println("Jaka ilosc pasazerow usunac?");
                int LiczbaPasazerow2 = scanner.nextInt();
                int counter2 = 0;
                while (counter2 < LiczbaPasazerow2 && !ListaPasazerow.isEmpty()) {
                    ListaPasazerow.remove(LiczbaPasazerow2 - 1);
                    counter2++;
                }
                aktualnaLiczbaOsob -= LiczbaPasazerow2;

            } else {
                System.out.println("Wprowadzanie osob zakonczone");
                break;
            }
        }
    }

    public static void WypelnijWagonAutomatycznie(){
        Random random = new Random();
        int LiczbaPasazerow = random.nextInt(7)+1;
        int couter = 0;
        while (couter < LiczbaPasazerow){
            Pasazer pasazer = new Pasazer();
            ListaPasazerow.add(pasazer);
            couter++;
        }
    }

    public static void WyswietlListeP(){
        for (Pasazer pasazer : ListaPasazerow) {
            System.out.println(pasazer);

        }
    }

    public static void pokazWagon() {
        int leng = 6;

        for (int i = 0; i < 18; i++) {
            System.out.print("=");
        }
        System.out.println();
        for (int i = 0; i < leng; i++) {
            System.out.print("| ");
            for (int j = 0; j < leng; j++) {
                System.out.print("*");
            }
            System.out.print("  ");
            for (int j = 0; j < leng; j++) {
                System.out.print("*");
            }
            System.out.println(" |");
        }

        for (int i = 0; i < 18; i++) {
            System.out.print("=");

        }
    }

    @Override
    public int getWagaWagonu() {
        return super.getWagaWagonu();
    }

    public String getNadawca() {
        return nadawca;
    }

    @Override
    public String toString() {
        return "Wagon pasażerksi";
    }

    @Override
    public void PodłączenieDoElektycznosci() {

    }
}
