package com.esocial.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;


public class DbConnection {

    private static final String PERSISTENCE_UNIT_NAME = "esocialPU";
    private static EntityManagerFactory factory;

    static {
        try {
            factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur lors de l'initialisation de l'EntityManagerFactory : " + e.getMessage());
        }
    }

    /**
     * Retourne une nouvelle instance d'EntityManager.
     * 
     * @return EntityManager
     */
    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

  
    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}
