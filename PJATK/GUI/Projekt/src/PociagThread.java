import java.util.List;

public class PociagThread extends Thread{
    private final Lokomotywa lokomotywa;
    private final Mapa StacjeKolejowe;

    public PociagThread(Lokomotywa lokomotywa, Mapa stacjeKolejowe) {
        this.lokomotywa = lokomotywa;
        this.StacjeKolejowe = stacjeKolejowe;
    }

    @Override
    public void run() {
        Stacja PierwszaStacja = lokomotywa.getStart();
        Stacja OstatniaStacja = lokomotywa.getEnd();

        List<Droga> drogaa = StacjeKolejowe.findRoad(lokomotywa);
        if (drogaa == null) {
            System.out.println("Nie znaleziono dorgi " + PierwszaStacja + " do " + OstatniaStacja);
            return;
        }

        System.out.println("Pociąg " + lokomotywa.getId() + " Rozpoczyna Podróż z " + PierwszaStacja + " do " + OstatniaStacja);

        int i = 0;
        boolean doPrzodu = true;
        while (true) {

            if(i==drogaa.size()) {
                doPrzodu = false;
                i--;
            }
            if(i==-1) {
                doPrzodu = true;
                i++;
            }

            Droga droga = drogaa.get(i);
            Stacja nastepnaStacja = droga.getnastepnaStacja(lokomotywa.getCurrent());

            lokomotywa.setCurrent(nastepnaStacja);

            if(doPrzodu)
                i++;
            else
                i--;

            try {
                droga.JedzLokomotywo(lokomotywa);
                lokomotywa.zaczekajNaStacji();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
