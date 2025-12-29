import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        // Port dynamique pour Render
        String portStr = System.getenv("PORT");
        int port = (portStr != null) ? Integer.parseInt(portStr) : 8080;
        port(port);

        // Sert les fichiers du dossier src/main/resources/public
        staticFiles.location("/public");

        // Redirige l'accueil vers la simulation
        get("/", (req, res) -> {
            res.redirect("/index.html");
            return null;
        });
    }
}