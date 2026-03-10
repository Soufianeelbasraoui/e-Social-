package com.esocial.service;

import com.esocial.dao.AssureDAO;
import com.esocial.dao.CotisationDAO;
import com.esocial.model.Assure;
import com.esocial.model.Cotisation;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DroitsSociauxService {

    private final CotisationDAO cotisationDAO = new CotisationDAO();
    private final AssureDAO assureDAO = new AssureDAO();


    public Map<String, Object> consulterDroits(Long assureId) {
        Assure assure = assureDAO.findById(assureId);
        if (assure == null) {
            throw new RuntimeException("Assuré non trouvé avec l'id: " + assureId);
        }

        int nombreMois = cotisationDAO.countMoisDeclaresByAssure(assureId);
        double totalCotisations = cotisationDAO.sumCotisationsByAssure(assureId);
        List<Cotisation> cotisations = cotisationDAO.findByAssure(assureId);

        Map<String, Object> droits = new HashMap<>();
        droits.put("assure", assure);
        droits.put("nombreMoisDeclares", nombreMois);
        droits.put("totalCotisations", totalCotisations);
        droits.put("cotisations", cotisations);

        return droits;
    }
}
