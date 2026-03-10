package com.esocial.service;

import com.esocial.dao.CotisationDAO;
import com.esocial.model.Assure;
import com.esocial.model.Cotisation;
import com.esocial.model.Declaration;
import java.util.List;

public class CotisationService {

    private static final double TAUX_SALARIAL = 0.0448;
    private static final double TAUX_PATRONAL = 0.0898;
    private static final double PLAFOND_MENSUEL = 6000.0;

    private final CotisationDAO cotisationDAO = new CotisationDAO();

    public Cotisation calculerEtEnregistrer(Assure assure, Declaration declaration, double salaireDeclare) {
        double salaireBase = Math.min(salaireDeclare, PLAFOND_MENSUEL);

        double cotisationSalariale = salaireBase * TAUX_SALARIAL;
        double cotisationPatronale = salaireBase * TAUX_PATRONAL;

        Cotisation cotisation = new Cotisation(
                cotisationSalariale,
                cotisationPatronale,
                salaireDeclare,
                declaration.getMois(),
                declaration.getAnnee(),
                assure,
                declaration);

        cotisationDAO.save(cotisation);
        return cotisation;
    }

    public List<Cotisation> getCotisationsByAssure(Long assureId) {
        return cotisationDAO.findByAssure(assureId);
    }

    public List<Cotisation> getCotisationsByDeclaration(Long declarationId) {
        return cotisationDAO.findByDeclaration(declarationId);
    }

    public List<Cotisation> getCotisationsByEmployeur(Long employeurId) {
        return cotisationDAO.findByEmployeur(employeurId);
    }


    public double getTotalCotisationsEmployeur(Long employeurId) {
        List<Cotisation> cotisations = cotisationDAO.findByEmployeur(employeurId);
        return cotisations.stream()
                .mapToDouble(c -> c.getCotisationSalariale() + c.getCotisationPatronale())
                .sum();
    }

    public List<Cotisation> getAllCotisations() {
        return cotisationDAO.findAll();
    }

    // Constantes accessibles
    public static double getTauxSalarial() {
        return TAUX_SALARIAL;
    }

    public static double getTauxPatronal() {
        return TAUX_PATRONAL;
    }

    public static double getPlafondMensuel() {
        return PLAFOND_MENSUEL;
    }
}
