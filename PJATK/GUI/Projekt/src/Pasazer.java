public class Pasazer {
    private int Nrbiletu;
    private static int couter;

    private static int WagaPasazera;


    public Pasazer(){
        Nrbiletu = couter++;
        this.WagaPasazera = 70;
    }

    public static int getCouter() {
        return couter;
    }

    public int getNrbiletu() {
        return Nrbiletu;
    }

    public static int getWagaPasazera() {
        return WagaPasazera;
    }

    @Override
    public String toString() {
        return "Numer Pasazera: " + Nrbiletu;
    }
}

