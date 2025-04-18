import java.util.Random;

abstract class Wagon {
    private int ID;
    private static int  counter = 1;
    private int wagaWagonu;
    int netto;
    int brutto;

    public Wagon(){
        Random random = new Random();
        this.ID = counter++;
        this.wagaWagonu = random.nextInt(32000,47000) ;
    }

    public int getID() {
        return ID;
    }

    public void setWagaWagonu(int wagaWagonu) {
        this.wagaWagonu += wagaWagonu;
    }


    public int getWagaWagonu() {
        return wagaWagonu;
    }


    public int getNetto() {
        return netto;
    }

    public void setNetto(int netto) {
        this.netto = netto;
    }

    public int getBrutto() {
        return brutto;
    }

    public void setBrutto(int brutto) {
        this.brutto = brutto;
    }
}


