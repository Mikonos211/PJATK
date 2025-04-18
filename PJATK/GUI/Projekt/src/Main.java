import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {

        Random random = new Random();

        Mapa graph = new Mapa();
        Stacja start = new Stacja("Start");
        Stacja station1 = new Stacja("Station 1");
        Stacja station2 = new Stacja("Station 2");
        Stacja station3 = new Stacja("Station 3");
        Stacja station4 = new Stacja("Station 4");
        Stacja station5 = new Stacja("Station 5");
        Stacja station6 = new Stacja("Station 6");
        Stacja station7 = new Stacja("Station 7");
        Stacja station8 = new Stacja("Station 8");
        Stacja station9 = new Stacja("Station 9");
        Stacja station10 = new Stacja("Station 10");
        Stacja end = new Stacja("Koniec");
        PrintWriter zapisa = new PrintWriter("AppState.txt");
        Lokomotywa lokomotywa = new Lokomotywa("Jazda", 5, start, end);
        int Wagony = random.nextInt(6) + 5;
        for (int i = 0; i <= Wagony; i++) {
            int JakiWagon = random.nextInt(11) + 1;
            switch (JakiWagon) {
                case 1:
                    pasażerski pasażerski = new pasażerski();
                    lokomotywa.dodajWagon(pasażerski);
                    break;

                case 2:
                    pocztowy pocztowy = new pocztowy();
                    lokomotywa.dodajWagon(pocztowy);
                    break;

                case 3:
                    bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                    lokomotywa.dodajWagon(bagazowopocztowy);
                    break;

                case 4:
                    restauracyjny restauracyjny = new restauracyjny();
                    lokomotywa.dodajWagon(restauracyjny);
                    break;

                case 5:
                    towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                    lokomotywa.dodajWagon(towarowyPodstawowy);
                    break;

                case 6:
                    TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                    lokomotywa.dodajWagon(towarowyCiezki);
                    break;

                case 7:
                    Chlodniczy chlodniczy = new Chlodniczy();
                    lokomotywa.dodajWagon(chlodniczy);
                    break;

                case 8:
                    naMaterialyCiekle naMaterialyCiekle = new naMaterialyCiekle();
                    lokomotywa.dodajWagon(naMaterialyCiekle);
                    break;

                case 9:
                    naMaterialyGazowe naMaterialyGazowe = new naMaterialyGazowe();
                    lokomotywa.dodajWagon(naMaterialyGazowe);
                    break;

                case 10:
                    naMaterialyWybuchowe naMaterialyWybuchowe = new naMaterialyWybuchowe();
                    lokomotywa.dodajWagon(naMaterialyWybuchowe);
                    break;

                case 11:
                    naMateriałyToksyczne naMateriałyToksyczne = new naMateriałyToksyczne();
                    lokomotywa.dodajWagon(naMateriałyToksyczne);
                    break;


                case 12:
                    naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                    lokomotywa.dodajWagon(naCiekleMaterialyToksyczne1);
                    break;

            }
        }
        Lokomotywa lokomotywa1 = new Lokomotywa("Pędziwiatr", 5, start, station2);
        for (int i = 0; i <= Wagony; i++) {
            int JakiWagon = random.nextInt(11) + 1;
            switch (JakiWagon) {
                case 1:
                    pasażerski pasażerski = new pasażerski();
                    lokomotywa1.dodajWagon(pasażerski);
                    break;

                case 2:
                    pocztowy pocztowy = new pocztowy();
                    lokomotywa1.dodajWagon(pocztowy);
                    break;

                case 3:
                    bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                    lokomotywa1.dodajWagon(bagazowopocztowy);
                    break;

                case 4:
                    restauracyjny restauracyjny = new restauracyjny();
                    lokomotywa1.dodajWagon(restauracyjny);
                    break;

                case 5:
                    towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                    lokomotywa1.dodajWagon(towarowyPodstawowy);
                    break;

                case 6:
                    TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                    lokomotywa1.dodajWagon(towarowyCiezki);
                    break;

                case 7:
                    Chlodniczy chlodniczy = new Chlodniczy();
                    lokomotywa1.dodajWagon(chlodniczy);
                    break;

                case 8:
                    naMaterialyCiekle naMaterialyCiekle = new naMaterialyCiekle();
                    lokomotywa1.dodajWagon(naMaterialyCiekle);
                    break;

                case 9:
                    naMaterialyGazowe naMaterialyGazowe = new naMaterialyGazowe();
                    lokomotywa1.dodajWagon(naMaterialyGazowe);
                    break;

                case 10:
                    naMaterialyWybuchowe naMaterialyWybuchowe = new naMaterialyWybuchowe();
                    lokomotywa1.dodajWagon(naMaterialyWybuchowe);
                    break;

                case 11:
                    naMateriałyToksyczne naMateriałyToksyczne = new naMateriałyToksyczne();
                    lokomotywa1.dodajWagon(naMateriałyToksyczne);
                    break;


                case 12:
                    naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                    lokomotywa1.dodajWagon(naCiekleMaterialyToksyczne1);
                    break;

            }
        }
            Lokomotywa lokomotywa2 = new Lokomotywa("rzułf", 5, station1, station3);
            for (int i = 0; i <= Wagony; i++) {
                int JakiWagon = random.nextInt(11) + 1;
                switch (JakiWagon) {
                    case 1:
                        pasażerski pasażerski = new pasażerski();
                        lokomotywa2.dodajWagon(pasażerski);
                        break;

                    case 2:
                        pocztowy pocztowy = new pocztowy();
                        lokomotywa2.dodajWagon(pocztowy);
                        break;

                    case 3:
                        bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                        lokomotywa2.dodajWagon(bagazowopocztowy);
                        break;

                    case 4:
                        restauracyjny restauracyjny = new restauracyjny();
                        lokomotywa2.dodajWagon(restauracyjny);
                        break;

                    case 5:
                        towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                        lokomotywa2.dodajWagon(towarowyPodstawowy);
                        break;

                    case 6:
                        TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                        lokomotywa2.dodajWagon(towarowyCiezki);
                        break;

                    case 7:
                        Chlodniczy chlodniczy = new Chlodniczy();
                        lokomotywa2.dodajWagon(chlodniczy);
                        break;

                    case 8:
                        naMaterialyCiekle naMaterialyCiekle = new naMaterialyCiekle();
                        lokomotywa2.dodajWagon(naMaterialyCiekle);
                        break;

                    case 9:
                        naMaterialyGazowe naMaterialyGazowe = new naMaterialyGazowe();
                        lokomotywa2.dodajWagon(naMaterialyGazowe);
                        break;

                    case 10:
                        naMaterialyWybuchowe naMaterialyWybuchowe = new naMaterialyWybuchowe();
                        lokomotywa2.dodajWagon(naMaterialyWybuchowe);
                        break;

                    case 11:
                        naMateriałyToksyczne naMateriałyToksyczne = new naMateriałyToksyczne();
                        lokomotywa2.dodajWagon(naMateriałyToksyczne);
                        break;


                    case 12:
                        naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                        lokomotywa2.dodajWagon(naCiekleMaterialyToksyczne1);
                        break;

                }
            }
        lokomotywa2.getWagonList().sort((o1, o2) -> Integer.compare(o1.getWagaWagonu(), o2.getWagaWagonu()));
        zapisa.println(lokomotywa2.getWagonList());
        zapisa.close();

            Lokomotywa lokomotywa3 = new Lokomotywa("Tomek", 5, station4, end);
        for (int i = 0; i <= Wagony; i++) {
            int JakiWagon = random.nextInt(11) + 1;
            switch (JakiWagon) {
                case 1:
                    pasażerski pasażerski = new pasażerski();
                    lokomotywa3.dodajWagon(pasażerski);
                    break;

                case 2:
                    pocztowy pocztowy = new pocztowy();
                    lokomotywa3.dodajWagon(pocztowy);
                    break;

                case 3:
                    bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                    lokomotywa3.dodajWagon(bagazowopocztowy);
                    break;

                case 4:
                    restauracyjny restauracyjny = new restauracyjny();
                    lokomotywa3.dodajWagon(restauracyjny);
                    break;

                case 5:
                    towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                    lokomotywa3.dodajWagon(towarowyPodstawowy);
                    break;

                case 6:
                    TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                    lokomotywa3.dodajWagon(towarowyCiezki);
                    break;

                case 7:
                    Chlodniczy chlodniczy = new Chlodniczy();
                    lokomotywa3.dodajWagon(chlodniczy);
                    break;

                case 8:
                    naMaterialyCiekle naMaterialyCiekle = new naMaterialyCiekle();
                    lokomotywa3.dodajWagon(naMaterialyCiekle);
                    break;

                case 9:
                    naMaterialyGazowe naMaterialyGazowe = new naMaterialyGazowe();
                    lokomotywa3.dodajWagon(naMaterialyGazowe);
                    break;

                case 10:
                    naMaterialyWybuchowe naMaterialyWybuchowe = new naMaterialyWybuchowe();
                    lokomotywa3.dodajWagon(naMaterialyWybuchowe);
                    break;

                case 11:
                    naMateriałyToksyczne naMateriałyToksyczne = new naMateriałyToksyczne();
                    lokomotywa3.dodajWagon(naMateriałyToksyczne);
                    break;


                case 12:
                    naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                    lokomotywa3.dodajWagon(naCiekleMaterialyToksyczne1);
                    break;

            }
        }
        lokomotywa3.getWagonList().sort((o1, o2) -> Integer.compare(o1.getWagaWagonu(), o2.getWagaWagonu()));
        zapisa.println(lokomotywa3.getWagonList());
        zapisa.close();
            Lokomotywa lokomotywa4 = new Lokomotywa("Sonic", 5, station8, station6);
        for (int i = 0; i <= Wagony; i++) {
            int JakiWagon = random.nextInt(11) + 1;
            switch (JakiWagon) {
                case 1:
                    pasażerski pasażerski = new pasażerski();
                    lokomotywa4.dodajWagon(pasażerski);
                    break;

                case 2:
                    pocztowy pocztowy = new pocztowy();
                    lokomotywa4.dodajWagon(pocztowy);
                    break;

                case 3:
                    bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                    lokomotywa4.dodajWagon(bagazowopocztowy);
                    break;

                case 4:
                    restauracyjny restauracyjny = new restauracyjny();
                    lokomotywa4.dodajWagon(restauracyjny);
                    break;

                case 5:
                    towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                    lokomotywa4.dodajWagon(towarowyPodstawowy);
                    break;

                case 6:
                    TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                    lokomotywa4.dodajWagon(towarowyCiezki);
                    break;

                case 7:
                    Chlodniczy chlodniczy = new Chlodniczy();
                    lokomotywa4.dodajWagon(chlodniczy);
                    break;

                case 8:
                    naMaterialyCiekle naMaterialyCiekle = new naMaterialyCiekle();
                    lokomotywa4.dodajWagon(naMaterialyCiekle);
                    break;

                case 9:
                    naMaterialyGazowe naMaterialyGazowe = new naMaterialyGazowe();
                    lokomotywa4.dodajWagon(naMaterialyGazowe);
                    break;

                case 10:
                    naMaterialyWybuchowe naMaterialyWybuchowe = new naMaterialyWybuchowe();
                    lokomotywa4.dodajWagon(naMaterialyWybuchowe);
                    break;

                case 11:
                    naMateriałyToksyczne naMateriałyToksyczne = new naMateriałyToksyczne();
                    lokomotywa4.dodajWagon(naMateriałyToksyczne);
                    break;


                case 12:
                    naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                    lokomotywa4.dodajWagon(naCiekleMaterialyToksyczne1);
                    break;

            }
        }
        lokomotywa4.getWagonList().sort((o1, o2) -> Integer.compare(o1.getWagaWagonu(), o2.getWagaWagonu()));
        zapisa.println(lokomotywa4.getWagonList());
        zapisa.close();

            Lokomotywa lokomotywa5 = new Lokomotywa("Masny Ben", 5, station4, station7);
        for (int i = 0; i <= Wagony; i++) {
            int JakiWagon = random.nextInt(11) + 1;
            switch (JakiWagon) {
                case 1:
                    pasażerski pasażerski = new pasażerski();
                    lokomotywa5.dodajWagon(pasażerski);
                    break;

                case 2:
                    pocztowy pocztowy = new pocztowy();
                    lokomotywa5.dodajWagon(pocztowy);
                    break;

                case 3:
                    bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                    lokomotywa5.dodajWagon(bagazowopocztowy);
                    break;

                case 4:
                    restauracyjny restauracyjny = new restauracyjny();
                    lokomotywa5.dodajWagon(restauracyjny);
                    break;

                case 5:
                    towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                    lokomotywa5.dodajWagon(towarowyPodstawowy);
                    break;

                case 6:
                    TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                    lokomotywa5.dodajWagon(towarowyCiezki);
                    break;

                case 7:
                    Chlodniczy chlodniczy = new Chlodniczy();
                    lokomotywa5.dodajWagon(chlodniczy);
                    break;

                case 8:
                    naMaterialyCiekle naMaterialyCiekle = new naMaterialyCiekle();
                    lokomotywa5.dodajWagon(naMaterialyCiekle);
                    break;

                case 9:
                    naMaterialyGazowe naMaterialyGazowe = new naMaterialyGazowe();
                    lokomotywa5.dodajWagon(naMaterialyGazowe);
                    break;

                case 10:
                    naMaterialyWybuchowe naMaterialyWybuchowe = new naMaterialyWybuchowe();
                    lokomotywa5.dodajWagon(naMaterialyWybuchowe);
                    break;

                case 11:
                    naMateriałyToksyczne naMateriałyToksyczne = new naMateriałyToksyczne();
                    lokomotywa5.dodajWagon(naMateriałyToksyczne);
                    break;


                case 12:
                    naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                    lokomotywa5.dodajWagon(naCiekleMaterialyToksyczne1);
                    break;

            }
        }

        lokomotywa5.getWagonList().sort((o1, o2) -> Integer.compare(o1.getWagaWagonu(), o2.getWagaWagonu()));
        zapisa.println(lokomotywa5.getWagonList());
        zapisa.close();

            Droga droga1 = new Droga(start, station1, 20);
            Droga droga2 = new Droga(station1, station2, 15);
            Droga droga3 = new Droga(station2, station3, 10);
            Droga droga4 = new Droga(station3, end, 25);
            Droga droga5 = new Droga(station1, station4, 15);
            Droga droga6 = new Droga(station4, station2, 30);
            Droga droga7 = new Droga(station2, station5, 32);
            Droga droga8 = new Droga(station5, station6, 17);
            Droga droga9 = new Droga(station6, station3, 17);
            Droga droga10 = new Droga(station3, station8, 11);
            Droga droga11 = new Droga(station8, station9, 29);
            Droga droga12 = new Droga(station9, end, 22);
            Droga droga13 = new Droga(station4, station8, 20);
            Droga droga14 = new Droga(start, station6, 16);
            Droga droga15 = new Droga(station6, station10, 16);
            Droga droga16 = new Droga(station10, end, 34);
            Droga droga17 = new Droga(station6, station7, 49);

            graph.addRoad(droga1);
            graph.addRoad(droga2);
            graph.addRoad(droga3);
            graph.addRoad(droga4);
            graph.addRoad(droga5);
            graph.addRoad(droga6);
            graph.addRoad(droga7);
            graph.addRoad(droga8);
            graph.addRoad(droga9);
            graph.addRoad(droga10);
            graph.addRoad(droga11);
            graph.addRoad(droga12);
            graph.addRoad(droga13);
            graph.addRoad(droga14);
            graph.addRoad(droga15);
            graph.addRoad(droga16);
            graph.addRoad(droga17);

            Scanner scanner = new Scanner(System.in);
            System.out.println("Witamy w Symulatorze PKP");
            System.out.println("Jeśli chcesz dodac swój pociąg do symulacji Wpisz 1, jeśli chcesz zobaczyć jakie pociągi będą wchodziły w squad symulacji wpisz 2, jeśli chcesz przejsc wprost do programu bez jego dodoawania wpisz 0");
            int x1 = scanner.nextInt();
            if (x1 == 1) {
                Lokomotywa lokomotywa6 = new Lokomotywa("Własny pociag", 5, start, station10);
                scanner.nextLine();
                System.out.println("Jaki wagon chcesz stworzyć");
                System.out.println(" 1 = Pasazerski ");
                System.out.println(" 2 = Pocztowy ");
                System.out.println(" 3 = Bagazowopocztowy ");
                System.out.println(" 4 = Restauracyjny");
                System.out.println(" 5 = Towarowy Podstawowy");
                System.out.println(" 6 = Towarowy Ciężki");
                System.out.println(" 7 = Chłodniczy");
                System.out.println(" 8 = Na materiały ciekłe");
                System.out.println(" 9 = Na materiały gazowe");
                System.out.println("10 = Na materiały Wybuchowe");
                System.out.println("11 = Na materiały Toksyczne");
                System.out.println("12 = Na materiały Ciekłe Toksyczne");
                System.out.println(" 0 = zakonczyć procedure");

                int AktualnaLiczbaWagonow = 0;
                int AktualnaWaga = 0;
                int AktualnaLiczbaWagonowElektycznych = 0;
                try {
                    while (AktualnaLiczbaWagonow < lokomotywa6.getMaxWagonow() && AktualnaWaga < lokomotywa6.getUciag() && AktualnaLiczbaWagonowElektycznych < lokomotywa6.getMaxWagonyElektyczne()) {
                        int i1 = scanner.nextInt();
                        if (i1 == 0) {
                            break;
                        }
                        switch (i1) {
                            case 1:
                                pasażerski pasażerski = new pasażerski();
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += pasażerski.getWagaWagonu();
                                AktualnaLiczbaWagonowElektycznych += 1;
                                lokomotywa6.dodajWagon(pasażerski);
                                System.out.println("Czy chcesz dodać Pasazerow recznie? 1 jeśli tak, 2 jeśli maja sie wygenerować automatycznie");
                                int i2 = scanner.nextInt();
                                if (i2 == 1) {
                                    pasażerski.WypelnijWagonRecznie();
                                    break;

                                } else if (i2 == 2) {
                                    pasażerski.WypelnijWagonAutomatycznie();
                                    break;
                                } else
                                    System.out.println("Stosuj sie do insturkcji!");
                                break;

                            case 2:
                                pocztowy pocztowy = new pocztowy();
                                lokomotywa6.dodajWagon(pocztowy);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaLiczbaWagonowElektycznych += 1;
                                AktualnaWaga += pocztowy.getWagaWagonu();
                                break;

                            case 3:
                                bagazowopocztowy bagazowopocztowy = new bagazowopocztowy();
                                lokomotywa6.dodajWagon(bagazowopocztowy);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += bagazowopocztowy.getWagaWagonu();
                                System.out.println("Czy chesz dodać Załadunek ręcznie? Jesli tak 1 , Jeśli nie 2");
                                int i3 = scanner.nextInt();
                                if (i3 == 1) {
                                    bagazowopocztowy.DodajUsunBagaz();
                                    break;
                                } else if (i3 == 2) {
                                    bagazowopocztowy.WypelnijBagarzeAutomatycznie();
                                    break;
                                } else
                                    System.out.println("Stosuj sie do insturkcji!");
                                break;


                            case 4:
                                restauracyjny restauracyjny = new restauracyjny();
                                lokomotywa6.dodajWagon(restauracyjny);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaLiczbaWagonowElektycznych += 1;
                                AktualnaWaga += restauracyjny.getWagaWagonu();
                                break;

                            case 5:
                                towarowyPodstawowy towarowyPodstawowy = new towarowyPodstawowy();
                                lokomotywa6.dodajWagon(towarowyPodstawowy);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += towarowyPodstawowy.getWagaTowarowyPod();
                                break;

                            case 6:
                                TowarowyCiezki towarowyCiezki = new TowarowyCiezki();
                                lokomotywa6.dodajWagon(towarowyCiezki);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += towarowyCiezki.getWagaWagonu();
                                break;

                            case 7:
                                Chlodniczy chlodniczy = new Chlodniczy();
                                lokomotywa6.dodajWagon(chlodniczy);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaLiczbaWagonowElektycznych += 1;
                                AktualnaWaga += chlodniczy.getWagaWagonu();
                                break;

                            case 8:
                                naMaterialyCiekle naMaterialyCiekle1 = new naMaterialyCiekle();
                                lokomotywa6.dodajWagon(naMaterialyCiekle1);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += naMaterialyCiekle1.getWagaWagonu();
                                break;

                            case 9:
                                naMaterialyGazowe naMaterialyGazowe1 = new naMaterialyGazowe();
                                lokomotywa6.dodajWagon(naMaterialyGazowe1);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += naMaterialyGazowe1.getWagaWagonu();
                                break;

                            case 10:
                                naMaterialyWybuchowe naMaterialyWybuchowe1 = new naMaterialyWybuchowe();
                                lokomotywa6.dodajWagon(naMaterialyWybuchowe1);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += naMaterialyWybuchowe1.getWagaWagonu();
                                break;

                            case 11:
                                naMateriałyToksyczne naMateriałyToksyczne1 = new naMateriałyToksyczne();
                                lokomotywa6.dodajWagon(naMateriałyToksyczne1);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += naMateriałyToksyczne1.getWagaWagonu();
                                break;


                            case 12:
                                naCiekleMaterialyToksyczne naCiekleMaterialyToksyczne1 = new naCiekleMaterialyToksyczne();
                                lokomotywa6.dodajWagon(naCiekleMaterialyToksyczne1);
                                AktualnaLiczbaWagonow += 1;
                                AktualnaWaga += naCiekleMaterialyToksyczne1.getWagaWagonu();
                                break;
                            default:
                                System.out.println("Nie stosujesz sie do instrukcji");


                        }
                        if (i1 != 0)
                            System.out.println("Dodać Kolejny wagon?");
                    }
                    throw new ToMuchExeption("Przekroczono Wartości pociagu");
                }catch (ToMuchExeption e){
                    System.out.println(e.getMessage());
                }
                System.out.println(lokomotywa6.getWagonList());
                PociagThread pociagThread7 = new PociagThread(lokomotywa6, graph);
                pociagThread7.start();
            }else if ( x1 == 2){
                System.out.println(lokomotywa.getWagonList());
                System.out.println(lokomotywa1.getWagonList());
                System.out.println(lokomotywa2.getWagonList());
                System.out.println(lokomotywa3.getWagonList());
                System.out.println(lokomotywa4.getWagonList());
                System.out.println(lokomotywa5.getWagonList());
            }

                PociagThread pociagThread = new PociagThread(lokomotywa, graph);
                pociagThread.start();
                PociagThread pociagThread2 = new PociagThread(lokomotywa1, graph);
                pociagThread2.start();
                PociagThread pociagThread3 = new PociagThread(lokomotywa2, graph);
                pociagThread3.start();
                PociagThread pociagThread4 = new PociagThread(lokomotywa3, graph);
                pociagThread4.start();
                PociagThread pociagThread5 = new PociagThread(lokomotywa4, graph);
                pociagThread5.start();
                PociagThread pociagThread6 = new PociagThread(lokomotywa5, graph);
                pociagThread6.start();

        }
    }
