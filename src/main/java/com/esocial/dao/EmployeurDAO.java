package com.esocial.dao;

import com.esocial.model.Employeur;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class EmployeurDAO {

    public void save(Employeur employeur) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(employeur);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public Employeur findById(Long id) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.find(Employeur.class, id);
        } finally {
            em.close();
        }
    }

    public List<Employeur> findAll() {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT e FROM Employeur e", Employeur.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void update(Employeur employeur) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(employeur);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Employeur employeur = em.find(Employeur.class, id);
            if (employeur != null) {
                em.remove(employeur);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}
