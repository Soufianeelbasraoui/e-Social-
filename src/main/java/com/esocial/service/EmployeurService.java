package com.esocial.service;

import com.esocial.dao.EmployeurDAO;
import com.esocial.model.Employeur;
import java.util.List;

public class EmployeurService {

    private final EmployeurDAO employeurDAO = new EmployeurDAO();

    public void ajouterEmployeur(String raisonSociale, String secteurActivite) {
        Employeur employeur = new Employeur(raisonSociale, secteurActivite);
        employeurDAO.save(employeur);
    }

    public Employeur getEmployeurById(Long id) {
        return employeurDAO.findById(id);
    }

    public List<Employeur> getAllEmployeurs() {
        return employeurDAO.findAll();
    }

    public void updateEmployeur(Employeur employeur) {
        employeurDAO.update(employeur);
    }

    public void deleteEmployeur(Long id) {
        employeurDAO.delete(id);
    }
}
