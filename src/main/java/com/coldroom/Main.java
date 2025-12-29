package com.coldroom;

import static spark.Spark.*;

public class Main {
    public static void main(String[] args) {
        port(Integer.parseInt(System.getenv().getOrDefault("PORT", "8080")));
        staticFiles.location("/public");
        get("/", (req, res) -> "Cold Room 3D – Server Running!");
    }
}
