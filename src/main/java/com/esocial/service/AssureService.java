package com.esocial.service;

import com.esocial.dao.AssureDAO;
import com.esocial.dao.EmployeurDAO;
import com.esocial.model.Assure;
import com.esocial.model.Employeur;
import java.util.List;

public class AssureService {

    private final AssureDAO assureDAO = new AssureDAO();
    private final EmployeurDAO employeurDAO = new EmployeurDAO();

    public void ajouterAssure(String nom, double salaireMensuel, Long employeurId) {
        Employeur employeur = employeurDAO.findById(employeurId);
        if (employeur == null) {
            throw new RuntimeException("Employeur non trouvé avec l'id: " + employeurId);
        }
        Assure assure = new Assure(nom, salaireMensuel, employeur);
        assureDAO.save(assure);
    }

    public Assure getAssureById(Long id) {
        return assureDAO.findById(id);
    }

    public List<Assure> getAllAssures() {
        return assureDAO.findAll();
    }

    public List<Assure> getAssuresByEmployeur(Long employeurId) {
        return assureDAO.findByEmployeur(employeurId);
    }

    public void modifierSalaire(Long assureId, double nouveauSalaire) {
        Assure assure = assureDAO.findById(assureId);
        if (assure == null) {
            throw new RuntimeException("Assuré non trouvé avec l'id: " + assureId);
        }
        assure.setSalaireMensuel(nouveauSalaire);
        assureDAO.update(assure);
    }

    public void updateAssure(Assure assure) {
        assureDAO.update(assure);
    }

    public void deleteAssure(Long id) {
        assureDAO.delete(id);
    }
}
