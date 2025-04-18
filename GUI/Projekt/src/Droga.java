import java.util.concurrent.Semaphore;

public class Droga {
   private int dlugosc;
   private Stacja start;
   private Stacja koniec;

    private Semaphore semaphore = new Semaphore(1);

    public Droga(Stacja start, Stacja koniec, int dlugosc) {
        this.start = start;
        this.koniec = koniec;
        this.dlugosc = dlugosc;
    }

    public void JedzLokomotywo(Lokomotywa lokomotywa) throws InterruptedException {
        semaphore.acquire();
        double predkosc = lokomotywa.getPredkosc();
        double przebytyDystans = 0.0;
        boolean przekroczonoPredkosc = false;
        while (przebytyDystans < dlugosc && !przekroczonoPredkosc) {
            try {
                Thread.sleep(1000);
                double Sekuna = 1.0;
                predkosc = predkosc * (1.0 + 0.03 * (Math.random() - 0.5));
                double pokonanaOdleglosc = predkosc * Sekuna;
                przebytyDystans += pokonanaOdleglosc;
                if (przebytyDystans > dlugosc)
                    System.out.println("Przebyta Droga: " + dlugosc + " przez " + lokomotywa.getNazwa());
                else
                    System.out.println("Przebyta Droga: " + przebytyDystans + " przez " + lokomotywa.getNazwa());
                if (predkosc <= 55) {
                    throw new RailroadHazard("Przekroczone 55 metrów na sekunde");
                }
            } catch (RailroadHazard e) {
                przekroczonoPredkosc = true;
                System.err.println("Wystąpił wyjątek: " + e.getMessage());
            }
        }
        semaphore.release();
    }
    public Stacja getnastepnaStacja(Stacja stacja) {
        if (start.equals(stacja)) {
            return koniec;
        } else if (koniec.equals(stacja)) {
            return start;
        } else {
            return null;
        }
    }
    public Stacja getStart() {
        return start;
    }

    public Stacja getKoniec() {
        return koniec;
    }

}
