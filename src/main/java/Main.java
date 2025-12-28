import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        // Port par défaut pour Replit et serveurs Web
        port(8080);

        // Emplacement des fichiers HTML/JS
        staticFiles.location("/public");

        // Message de démarrage
        System.out.println("=== Simulation Chambre Froide 3D Lancée ===");
        System.out.println("Accédez à : http://localhost:8080");

        // API de test pour la température
        get("/api/data", (req, res) -> {
            res.type("application/json");
            return "{\"temperature\": -18.4, \"unite\": \"Celsius\"}";
        });
    }
}
