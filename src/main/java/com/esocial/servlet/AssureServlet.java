package com.esocial.servlet;

import com.esocial.model.Assure;
import com.esocial.service.AssureService;
import com.esocial.service.EmployeurService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assures")
public class AssureServlet extends HttpServlet {

    private final AssureService assureService = new AssureService();
    private final EmployeurService employeurService = new EmployeurService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "form":
                String editId = request.getParameter("id");
                if (editId != null) {
                    request.setAttribute("assure", assureService.getAssureById(Long.parseLong(editId)));
                }
                request.setAttribute("employeurs", employeurService.getAllEmployeurs());
                request.getRequestDispatcher("/jsp/assures/form.jsp").forward(request, response);
                break;
            case "delete":
                assureService.deleteAssure(Long.parseLong(request.getParameter("id")));
                response.sendRedirect(request.getContextPath() + "/assures");
                break;
            case "byEmployeur":
                Long empId = Long.parseLong(request.getParameter("employeurId"));
                request.setAttribute("assures", assureService.getAssuresByEmployeur(empId));
                request.setAttribute("employeur", employeurService.getEmployeurById(empId));
                request.getRequestDispatcher("/jsp/assures/list.jsp").forward(request, response);
                break;
            default:
                String filterEmp = request.getParameter("employeurId");
                if (filterEmp != null && !filterEmp.isEmpty()) {
                    request.setAttribute("assures", assureService.getAssuresByEmployeur(Long.parseLong(filterEmp)));
                } else {
                    request.setAttribute("assures", assureService.getAllAssures());
                }
                request.setAttribute("employeurs", employeurService.getAllEmployeurs());
                request.getRequestDispatcher("/jsp/assures/list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateSalaire".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            double nouveauSalaire = Double.parseDouble(request.getParameter("salaireMensuel"));
            assureService.modifierSalaire(id, nouveauSalaire);
        } else {
            String idStr = request.getParameter("id");
            String nom = request.getParameter("nom");
            double salaireMensuel = Double.parseDouble(request.getParameter("salaireMensuel"));
            Long employeurId = Long.parseLong(request.getParameter("employeurId"));

            if (idStr != null && !idStr.isEmpty()) {
                Assure assure = assureService.getAssureById(Long.parseLong(idStr));
                assure.setNom(nom);
                assure.setSalaireMensuel(salaireMensuel);
                assureService.updateAssure(assure);
            } else {
                assureService.ajouterAssure(nom, salaireMensuel, employeurId);
            }
        }

        response.sendRedirect(request.getContextPath() + "/assures");
    }
}
