package com.esocial.servlet;

import com.esocial.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("")
public class DashboardServlet extends HttpServlet {

    private final EmployeurService employeurService = new EmployeurService();
    private final AssureService assureService = new AssureService();
    private final DeclarationService declarationService = new DeclarationService();
    private final CotisationService cotisationService = new CotisationService();


    public static class ActivityDTO {
        private String entite;
        private String type;
        private String date;
        private String statut;
        private String statutCss;

        public ActivityDTO(String entite, String type, String date, String statut, String statutCss) {
            this.entite = entite;
            this.type = type;
            this.date = date;
            this.statut = statut;
            this.statutCss = statutCss;
        }

        public String getEntite() {
            return entite;
        }

        public String getType() {
            return type;
        }

        public String getDate() {
            return date;
        }

        public String getStatut() {
            return statut;
        }

        public String getStatutCss() {
            return statutCss;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("employeurCount", employeurService.getAllEmployeurs().size());
        request.setAttribute("assureCount", assureService.getAllAssures().size());
        request.setAttribute("declarationCount", declarationService.getAllDeclarations().size());
        request.setAttribute("cotisationCount", cotisationService.getAllCotisations().size());


        java.util.List<ActivityDTO> activities = new java.util.ArrayList<>();
        java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy");


        java.util.List<com.esocial.model.Declaration> decls = declarationService.getAllDeclarations();
        decls.sort(java.util.Comparator.comparing(com.esocial.model.Declaration::getId).reversed());
        for (int i = 0; i < Math.min(2, decls.size()); i++) {
            com.esocial.model.Declaration d = decls.get(i);
            String dateStr = d.getDateDeclaration() != null ? d.getDateDeclaration().format(formatter)
                    : java.time.LocalDate.now().format(formatter);
            activities.add(new ActivityDTO(d.getEmployeur().getRaisonSociale(),
                    "Déclaration " + d.getMois() + "/" + d.getAnnee(), dateStr, "Validé", "badge-success"));
        }

        java.util.List<com.esocial.model.Employeur> employeurs = employeurService.getAllEmployeurs();
        employeurs.sort(java.util.Comparator.comparing(com.esocial.model.Employeur::getId).reversed());
        for (int i = 0; i < Math.min(2, employeurs.size()); i++) {
            com.esocial.model.Employeur e = employeurs.get(i);
            String dateStr = java.time.LocalDate.now().format(formatter); // No date in employeur, use today
            activities.add(
                    new ActivityDTO(e.getRaisonSociale(), "Nouvel Employeur", dateStr, "Enregistré", "badge-success"));
        }

        java.util.List<com.esocial.model.Assure> assures = assureService.getAllAssures();
        assures.sort(java.util.Comparator.comparing(com.esocial.model.Assure::getId).reversed());
        for (int i = 0; i < Math.min(2, assures.size()); i++) {
            com.esocial.model.Assure a = assures.get(i);
            String dateStr = java.time.LocalDate.now().format(formatter);
            activities.add(new ActivityDTO(a.getNom(), "Nouvel Employé", dateStr, "Actif",
                    "badge-primary"));
        }

        request.setAttribute("recentActivities", activities);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
