package com.esocial.dao;

import com.esocial.model.Assure;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class AssureDAO {

    public void save(Assure assure) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(assure);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public Assure findById(Long id) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.find(Assure.class, id);
        } finally {
            em.close();
        }
    }

    public List<Assure> findAll() {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT a FROM Assure a", Assure.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Assure> findByEmployeur(Long employeurId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT a FROM Assure a WHERE a.employeur.id = :empId", Assure.class)
                    .setParameter("empId", employeurId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void update(Assure assure) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(assure);
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
            Assure assure = em.find(Assure.class, id);
            if (assure != null) {
                em.remove(assure);
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
