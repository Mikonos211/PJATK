import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

public class Service {
    public static ArrayList<Observation> parse(String dir) {
        ArrayList<Observation> observations = new ArrayList<>();

        try (DirectoryStream<Path> directories = Files.newDirectoryStream(Paths.get(dir))) {
            for (Path directory : directories) {
                if (Files.isDirectory(directory)) {
                    String language = directory.getFileName().toString();
                    StringBuilder stringBuilder = new StringBuilder();

                    try (DirectoryStream<Path> files = Files.newDirectoryStream(directory)) {
                        for (Path file : files) {
                            if (Files.isRegularFile(file)) {
                                try (BufferedReader br = new BufferedReader(new FileReader(file.toFile()))) {
                                    String line;
                                    while ((line = br.readLine()) != null) {
                                        stringBuilder.append(line.toLowerCase().replaceAll("[^a-zA-Z]", ""));
                                    }
                                }
                            }
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                    observations.add(new Observation(language, stringBuilder.toString()));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return observations;
    }
}
