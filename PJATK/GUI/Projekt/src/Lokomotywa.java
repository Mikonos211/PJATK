import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Lokomotywa {
         private int MaxWagonow;
         private int Uciag;
         private int MaxWagonyElektyczne;
        private int ID;
        private static int counter = 1;

       private String nazwa;
       private Stacja macierzysta;
       private Stacja zrodlowa;
       private Stacja docelowa;

       private int predkosc;

        private ArrayList<Wagon> wagonList;

        public Lokomotywa(String nazwa, int predkosc, Stacja macierzysta, Stacja docelowa) {
            this.ID=counter++;
            wagonList = new ArrayList<>();
            this.nazwa = nazwa;
            this.predkosc = predkosc;
            this.macierzysta = macierzysta;
            this.docelowa = docelowa;
            this.zrodlowa = macierzysta;
            this.MaxWagonow = 10;
            this.Uciag = 470000;
            this.MaxWagonyElektyczne = 4;
        }

    public void zaczekajNaStacji() throws InterruptedException {
        System.out.println("Przybycie do stacji " + zrodlowa.getName());
        if(zrodlowa.equals(macierzysta)||zrodlowa.equals(docelowa)) {
            System.out.println("Odjazd w droge powrotna za 30s ");
            Thread.sleep(30000);
        } else {
            System.out.println("Odjazd za 2s");
            Thread.sleep(2000);
        }
        System.out.println("Odjazd ze stacji " + zrodlowa.getName());
    }
    public void Wychamuj(){
            System.out.println("MaciekChamuj");
            this.predkosc = 0;
    }

    public void dodajWagon(Wagon wagon) {
        wagonList.add(wagon);
    }
    public ArrayList<Wagon> getWagonList() {
            return wagonList;
        }
        public Stacja getStart() {
            return macierzysta;
        }
        public Stacja getCurrent() {
            return zrodlowa;
        }

        public Stacja getEnd() {
            return docelowa;
        }

        public void setCurrent(Stacja current) {
            zrodlowa = current;
        }
        public int getId() {
            return ID;
        }
        public int getMaxWagonyElektyczne() {
        return MaxWagonyElektyczne;
    }
    public int getUciag() {
        return Uciag;
    }
    public int getMaxWagonow() {
        return MaxWagonow;
    }

    public String getNazwa() {
        return nazwa;
    }

    public int getPredkosc() {
        return predkosc;
    }

}

