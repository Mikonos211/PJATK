import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Mapa {
    private List<Droga> drogas;

    public Mapa() {
        drogas = new ArrayList<>();
    }


    public void addRoad(Droga droga) {
        drogas.add(droga);
    }

    public List<Droga> findRoad(Lokomotywa lokomotywa) {
        Stacja start = lokomotywa.getStart();
        Stacja end = lokomotywa.getEnd();
        List<Droga> path = new ArrayList<>();
        Set<Stacja> visited = new HashSet<>();
        znajdzDroge(start, end, visited, path);
        return path;
    }

    private boolean znajdzDroge(Stacja obecna, Stacja koncowa, Set<Stacja> odwiedzone, List<Droga> path) {
        odwiedzone.add(obecna);

        if (obecna.equals(koncowa)) {
            return true;
        }

        List<Droga> drogiPolaczoneZAktualnaStacja = getRoads(obecna);

        return drogiPolaczoneZAktualnaStacja.stream()
                .filter(droga -> !odwiedzone.contains(droga.getnastepnaStacja(obecna)))
                .map(droga -> {
                    path.add(droga);
                    boolean found = znajdzDroge(droga.getnastepnaStacja(obecna), koncowa, odwiedzone, path);
                    if (!found) {
                        path.remove(droga);
                    }
                    return found;
                })
                .anyMatch(found -> found);
    }

    public List<Droga> getRoads(Stacja station) {
        List<Droga> drogi = new ArrayList<>();

        for (int i = 0; i < this.drogas.size(); i++) {
            Droga droga = this.drogas.get(i);
            if (droga.getStart().equals(station) || droga.getKoniec().equals(station)) {
                drogi.add(droga);
            }
        }
        return drogi;
    }

}
