package com.esocial.service;

import com.esocial.dao.DeclarationDAO;
import com.esocial.dao.EmployeurDAO;
import com.esocial.dao.AssureDAO;
import com.esocial.model.*;
import java.time.LocalDate;
import java.util.List;

public class DeclarationService {

    private final DeclarationDAO declarationDAO = new DeclarationDAO();
    private final EmployeurDAO employeurDAO = new EmployeurDAO();
    private final AssureDAO assureDAO = new AssureDAO();
    private final CotisationService cotisationService = new CotisationService();

    public Declaration creerDeclaration(Long employeurId, int mois, int annee) {
        // Vérifier l'unicité (employeur, mois, année)
        Declaration existing = declarationDAO.findByEmployeurAndMoisAndAnnee(employeurId, mois, annee);
        if (existing != null) {
            throw new RuntimeException("Une déclaration existe déjà pour cet employeur pour " + mois + "/" + annee);
        }

        Employeur employeur = employeurDAO.findById(employeurId);
        if (employeur == null) {
            throw new RuntimeException("Employeur non trouvé avec l'id: " + employeurId);
        }

        Declaration declaration = new Declaration(mois, annee, LocalDate.now(), employeur);
        declarationDAO.save(declaration);
        return declaration;
    }

    public void ajouterLigneDeclaration(Long declarationId, Long assureId, double salaireDeclare) {
        Declaration declaration = declarationDAO.findById(declarationId);
        if (declaration == null) {
            throw new RuntimeException("Déclaration non trouvée avec l'id: " + declarationId);
        }

        Assure assure = assureDAO.findById(assureId);
        if (assure == null) {
            throw new RuntimeException("Assuré non trouvé avec l'id: " + assureId);
        }

        LigneDeclaration ligne = new LigneDeclaration(salaireDeclare, declaration, assure);
        declarationDAO.saveLigne(ligne);

        // Calculer et enregistrer la cotisation automatiquement
        cotisationService.calculerEtEnregistrer(assure, declaration, salaireDeclare);
    }

    public Declaration getDeclarationById(Long id) {
        return declarationDAO.findById(id);
    }

    public List<Declaration> getAllDeclarations() {
        return declarationDAO.findAll();
    }

    public List<Declaration> getDeclarationsByEmployeur(Long employeurId) {
        return declarationDAO.findByEmployeur(employeurId);
    }

    public List<LigneDeclaration> getLignesByDeclaration(Long declarationId) {
        return declarationDAO.findLignesByDeclaration(declarationId);
    }
}
