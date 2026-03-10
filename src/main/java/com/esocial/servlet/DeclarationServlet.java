package com.esocial.servlet;

import com.esocial.model.Declaration;
import com.esocial.service.DeclarationService;
import com.esocial.service.EmployeurService;
import com.esocial.service.AssureService;
import com.esocial.service.CotisationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/declarations")
public class DeclarationServlet extends HttpServlet {

    private final DeclarationService declarationService = new DeclarationService();
    private final EmployeurService employeurService = new EmployeurService();
    private final AssureService assureService = new AssureService();
    private final CotisationService cotisationService = new CotisationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "form":
                request.setAttribute("employeurs", employeurService.getAllEmployeurs());
                request.getRequestDispatcher("/jsp/declarations/form.jsp").forward(request, response);
                break;
            case "details":
                Long id = Long.parseLong(request.getParameter("id"));
                Declaration declaration = declarationService.getDeclarationById(id);
                request.setAttribute("declaration", declaration);
                request.setAttribute("lignes", declarationService.getLignesByDeclaration(id));
                request.setAttribute("cotisations", cotisationService.getCotisationsByDeclaration(id));
                request.getRequestDispatcher("/jsp/declarations/details.jsp").forward(request, response);
                break;
            case "addLigne":
                Long decId = Long.parseLong(request.getParameter("declarationId"));
                Declaration dec = declarationService.getDeclarationById(decId);
                request.setAttribute("declaration", dec);
                request.setAttribute("assures", assureService.getAssuresByEmployeur(dec.getEmployeur().getId()));
                request.getRequestDispatcher("/jsp/declarations/addLigne.jsp").forward(request, response);
                break;
            default:
                String filterEmp = request.getParameter("employeurId");
                if (filterEmp != null && !filterEmp.isEmpty()) {
                    request.setAttribute("declarations",
                            declarationService.getDeclarationsByEmployeur(Long.parseLong(filterEmp)));
                } else {
                    request.setAttribute("declarations", declarationService.getAllDeclarations());
                }
                request.setAttribute("employeurs", employeurService.getAllEmployeurs());
                request.getRequestDispatcher("/jsp/declarations/list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("addLigne".equals(action)) {
                Long declarationId = Long.parseLong(request.getParameter("declarationId"));
                Long assureId = Long.parseLong(request.getParameter("assureId"));
                double salaireDeclare = Double.parseDouble(request.getParameter("salaireDeclare"));
                declarationService.ajouterLigneDeclaration(declarationId, assureId, salaireDeclare);
                response.sendRedirect(request.getContextPath() + "/declarations?action=details&id=" + declarationId);
            } else {
                Long employeurId = Long.parseLong(request.getParameter("employeurId"));
                int mois = Integer.parseInt(request.getParameter("mois"));
                int annee = Integer.parseInt(request.getParameter("annee"));
                Declaration declaration = declarationService.creerDeclaration(employeurId, mois, annee);
                response.sendRedirect(
                        request.getContextPath() + "/declarations?action=details&id=" + declaration.getId());
            }
        } catch (RuntimeException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("employeurs", employeurService.getAllEmployeurs());
            request.getRequestDispatcher("/jsp/declarations/form.jsp").forward(request, response);
        }
    }
}
