package com.esocial.dao;

import com.esocial.model.Declaration;
import com.esocial.model.LigneDeclaration;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import java.util.List;

public class DeclarationDAO {

    public void save(Declaration declaration) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(declaration);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public Declaration findById(Long id) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.find(Declaration.class, id);
        } finally {
            em.close();
        }
    }

    public List<Declaration> findAll() {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery("SELECT d FROM Declaration d ORDER BY d.annee DESC, d.mois DESC", Declaration.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Declaration> findByEmployeur(Long employeurId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery(
                    "SELECT d FROM Declaration d WHERE d.employeur.id = :empId ORDER BY d.annee DESC, d.mois DESC",
                    Declaration.class)
                    .setParameter("empId", employeurId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public Declaration findByEmployeurAndMoisAndAnnee(Long employeurId, int mois, int annee) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em.createQuery(
                    "SELECT d FROM Declaration d WHERE d.employeur.id = :empId AND d.mois = :mois AND d.annee = :annee",
                    Declaration.class)
                    .setParameter("empId", employeurId)
                    .setParameter("mois", mois)
                    .setParameter("annee", annee)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public void saveLigne(LigneDeclaration ligne) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(ligne);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public List<LigneDeclaration> findLignesByDeclaration(Long declarationId) {
        EntityManager em = DbConnection.getEntityManager();
        try {
            return em
                    .createQuery("SELECT l FROM LigneDeclaration l WHERE l.declaration.id = :decId",
                            LigneDeclaration.class)
                    .setParameter("decId", declarationId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = DbConnection.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Declaration declaration = em.find(Declaration.class, id);
            if (declaration != null) {
                em.remove(declaration);
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
