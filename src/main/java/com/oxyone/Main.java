package com.oxyone;

import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        // Port pour Render et Cloud Shell
        port(8080);

        // Emplacement de votre index.html (dans src/main/resources/public)
        staticFiles.location("/public");

        // Route API pour les données du moteur (Température, Pression, etc.)
        get("/api/data", (req, res) -> {
            res.type("application/json");
            return "{\"temperature\": -18.4, \"status\": \"OK\", \"source\": \"Wi-Fi Relay\"}";
        });

        // Route pour recevoir l'image du moteur (POST depuis le relais)
        post("/api/image", (req, res) -> {
            // Ici on recevra l'image envoyée par le boîtier Wi-Fi
            return "Image reçue par OxyONE";
        });

        System.out.println("Serveur OxyONE démarré sur le port 8080...");
    }
}
