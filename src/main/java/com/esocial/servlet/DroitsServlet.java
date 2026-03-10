package com.esocial.servlet;

import com.esocial.service.AssureService;
import com.esocial.service.DroitsSociauxService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/droits")
public class DroitsServlet extends HttpServlet {

    private final DroitsSociauxService droitsService = new DroitsSociauxService();
    private final AssureService assureService = new AssureService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String assureId = request.getParameter("assureId");

        request.setAttribute("assures", assureService.getAllAssures());

        if (assureId != null && !assureId.isEmpty()) {
            try {
                Map<String, Object> droits = droitsService.consulterDroits(Long.parseLong(assureId));
                request.setAttribute("droits", droits);
                request.setAttribute("selectedAssureId", assureId);
            } catch (RuntimeException e) {
                request.setAttribute("error", e.getMessage());
            }
        }

        request.getRequestDispatcher("/jsp/droits/consultation.jsp").forward(request, response);
    }
}
