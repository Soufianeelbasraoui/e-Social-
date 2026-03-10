package com.esocial.dao;

import com.esocial.model.Cotisation;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class CotisationDAO {

    public void save(Cotisation cotisation) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(cotisation);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public List<Cotisation> findAll() {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Cotisation c", Cotisation.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Cotisation> findByAssure(Long assureId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Cotisation c WHERE c.assure.id = :assureId", Cotisation.class)
                    .setParameter("assureId", assureId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Cotisation> findByDeclaration(Long declarationId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Cotisation c WHERE c.declaration.id = :decId", Cotisation.class)
                    .setParameter("decId", declarationId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Cotisation> findByEmployeur(Long employeurId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Cotisation c WHERE c.assure.employeur.id = :empId", Cotisation.class)
                    .setParameter("empId", employeurId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public int countMoisDeclaresByAssure(Long assureId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            Long count = em.createQuery(
                    "SELECT COUNT(DISTINCT CONCAT(c.mois, '-', c.annee)) FROM Cotisation c WHERE c.assure.id = :assureId",
                    Long.class)
                    .setParameter("assureId", assureId)
                    .getSingleResult();
            return count != null ? count.intValue() : 0;
        } finally {
            em.close();
        }
    }

    public double sumCotisationsByAssure(Long assureId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            Double sum = em.createQuery(
                    "SELECT SUM(c.cotisationSalariale + c.cotisationPatronale) FROM Cotisation c WHERE c.assure.id = :assureId",
                    Double.class)
                    .setParameter("assureId", assureId)
                    .getSingleResult();
            return sum != null ? sum : 0.0;
        } finally {
            em.close();
        }
    }
}
