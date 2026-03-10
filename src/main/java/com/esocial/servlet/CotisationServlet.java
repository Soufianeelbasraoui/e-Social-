package com.esocial.servlet;

import com.esocial.service.CotisationService;
import com.esocial.service.EmployeurService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cotisations")
public class CotisationServlet extends HttpServlet {

    private final CotisationService cotisationService = new CotisationService();
    private final EmployeurService employeurService = new EmployeurService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeurId = request.getParameter("employeurId");

        if (employeurId != null && !employeurId.isEmpty()) {
            Long empId = Long.parseLong(employeurId);
            request.setAttribute("cotisations", cotisationService.getCotisationsByEmployeur(empId));
            request.setAttribute("totalCotisations", cotisationService.getTotalCotisationsEmployeur(empId));
            request.setAttribute("selectedEmployeur", employeurService.getEmployeurById(empId));
        } else {
            request.setAttribute("cotisations", cotisationService.getAllCotisations());
        }

        request.setAttribute("employeurs", employeurService.getAllEmployeurs());
        request.setAttribute("tauxSalarial", CotisationService.getTauxSalarial() * 100);
        request.setAttribute("tauxPatronal", CotisationService.getTauxPatronal() * 100);
        request.setAttribute("plafond", CotisationService.getPlafondMensuel());

        request.getRequestDispatcher("/jsp/cotisations/list.jsp").forward(request, response);
    }
}
