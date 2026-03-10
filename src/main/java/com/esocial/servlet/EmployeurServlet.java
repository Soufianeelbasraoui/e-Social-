package com.esocial.servlet;

import com.esocial.model.Employeur;
import com.esocial.service.EmployeurService;
import com.esocial.service.AssureService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/employeurs")
public class EmployeurServlet extends HttpServlet {

    private final EmployeurService employeurService = new EmployeurService();
    private final AssureService assureService = new AssureService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "details":
                Long id = Long.parseLong(request.getParameter("id"));
                Employeur employeur = employeurService.getEmployeurById(id);
                request.setAttribute("employeur", employeur);
                request.setAttribute("assures", assureService.getAssuresByEmployeur(id));
                request.getRequestDispatcher("/jsp/employeurs/details.jsp").forward(request, response);
                break;
            case "form":
                String editId = request.getParameter("id");
                if (editId != null) {
                    request.setAttribute("employeur", employeurService.getEmployeurById(Long.parseLong(editId)));
                }
                request.getRequestDispatcher("/jsp/employeurs/form.jsp").forward(request, response);
                break;
            case "delete":
                employeurService.deleteEmployeur(Long.parseLong(request.getParameter("id")));
                response.sendRedirect(request.getContextPath() + "/employeurs");
                break;
            default:
                List<Employeur> employeurs = employeurService.getAllEmployeurs();
                request.setAttribute("employeurs", employeurs);
                request.getRequestDispatcher("/jsp/employeurs/list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String raisonSociale = request.getParameter("raisonSociale");
        String secteurActivite = request.getParameter("secteurActivite");

        if (idStr != null && !idStr.isEmpty()) {

            Employeur employeur = employeurService.getEmployeurById(Long.parseLong(idStr));
            employeur.setRaisonSociale(raisonSociale);
            employeur.setSecteurActivite(secteurActivite);
            employeurService.updateEmployeur(employeur);
        } else {

            employeurService.ajouterEmployeur(raisonSociale, secteurActivite);
        }

        response.sendRedirect(request.getContextPath() + "/employeurs");
    }
}
