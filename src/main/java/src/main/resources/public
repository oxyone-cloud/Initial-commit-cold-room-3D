import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {

        // Port dynamique fourni par Render
        String portEnv = System.getenv("PORT");
        if (portEnv != null) {
            port(Integer.parseInt(portEnv));
        } else {
            port(8080); // fallback local
        }

        // Dossiers des fichiers HTML/JS (public doit être dans resources/public)
        staticFiles.location("/public");

        System.out.println("=== Simulation Chambre Froide 3D Lancée ===");
        System.out.println("Accédez à Render avec l'URL fournie");

        get("/api/data", (req, res) -> {
            res.type("application/json");
            return "{\"temperature\": -18.4, \"unite\": \"Celsius\"}";
        });
    }
}
