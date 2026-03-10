<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Déclarations"/>
    <jsp:param name="active" value="declarations"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">Déclarations Mensuelles</h1>
            <p class="card-subtitle">Déclarations de salaires des employeurs</p>
        </div>
        <div style="display: flex; gap: 12px; align-items: center;">
            <form method="get" action="${pageContext.request.contextPath}/declarations" style="display: flex; gap: 8px;">
                <select name="employeurId" style="padding: 8px 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit; font-size: 0.875rem;">
                    <option value="">Tous les employeurs</option>
                    <c:forEach var="emp" items="${employeurs}">
                        <option value="${emp.id}" ${param.employeurId == emp.id ? 'selected' : ''}>${emp.raisonSociale}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-outline" style="padding: 8px 12px;">Filtrer</button>
            </form>
            <a href="${pageContext.request.contextPath}/declarations?action=form" class="btn btn-primary">+ Nouvelle Déclaration</a>
        </div>
    </div>
    
    <div class="card">
        <div class="card-body" style="padding: 0;">
            <c:choose>
                <c:when test="${empty declarations}">
                    <div style="text-align: center; padding: 48px; color: var(--text-muted);">
                        <svg style="width: 48px; height: 48px; color: var(--text-light); margin: 0 auto 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                        <h4>Aucune déclaration</h4>
                        <p>Créez une déclaration mensuelle pour commencer.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-container">
                        <table class="professional-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Employeur</th>
                                    <th>Période</th>
                                    <th>Date de Déclaration</th>
                                    <th class="text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dec" items="${declarations}">
                                    <tr>
                                        <td><span class="status-badge badge-purple">#${dec.id}</span></td>
                                        <td><strong>${dec.employeur.raisonSociale}</strong></td>
                                        <td>
                                            <span class="status-badge badge-primary">${dec.mois}/${dec.annee}</span>
                                        </td>
                                        <td style="color: var(--text-muted);">${dec.dateDeclaration}</td>
                                        <td class="text-right">
                                            <div style="display: flex; gap: 8px; justify-content: flex-end;">
                                                <a href="${pageContext.request.contextPath}/declarations?action=details&id=${dec.id}" class="btn btn-outline" style="padding: 6px 12px;">Détails</a>
                                                <a href="${pageContext.request.contextPath}/declarations?action=addLigne&declarationId=${dec.id}" class="btn btn-primary" style="padding: 6px 12px;">+ Salaire</a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp"/>
