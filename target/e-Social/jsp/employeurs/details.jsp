<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Détails Employeur"/>
    <jsp:param name="active" value="employeurs"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">${employeur.raisonSociale}</h1>
            <p class="card-subtitle">Détails de l'employeur #${employeur.id}</p>
        </div>
        <div style="display: flex; gap: 8px;">
            <a href="${pageContext.request.contextPath}/employeurs" class="btn btn-outline">Retour</a>
            <a href="${pageContext.request.contextPath}/employeurs?action=form&id=${employeur.id}" class="btn btn-outline" style="border-color: var(--warning-text); color: var(--warning-text);">Modifier</a>
        </div>
    </div>
    
    <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; margin-bottom: 24px;">
        <div class="card" style="margin-bottom: 0;">
            <div class="card-body">
                <span class="stat-label">Raison Sociale</span>
                <div class="stat-value" style="font-size: 1.25rem;">${employeur.raisonSociale}</div>
            </div>
        </div>
        <div class="card" style="margin-bottom: 0;">
            <div class="card-body">
                <span class="stat-label">Secteur d'Activité</span>
                <div class="stat-value" style="font-size: 1.25rem;">${employeur.secteurActivite}</div>
            </div>
        </div>
        <div class="card" style="margin-bottom: 0;">
            <div class="card-body">
                <span class="stat-label">Nombre d'Employés</span>
                <div class="stat-value" style="font-size: 1.25rem;">${assures.size()}</div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header" style="border-bottom: none; padding-bottom: 0;">
            <h3 class="card-title">Employés Associés</h3>
            <a href="${pageContext.request.contextPath}/assures?action=form&defaultEmployeur=${employeur.id}" class="btn btn-primary" style="padding: 6px 16px;">+ Ajouter</a>
        </div>
        <div class="card-body" style="padding: 0;">
            <c:choose>
                <c:when test="${empty assures}">
                    <div style="text-align: center; padding: 48px; color: var(--text-muted);">
                        <svg style="width: 48px; height: 48px; color: var(--text-light); margin: 0 auto 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                        <h4>Aucun employé associé</h4>
                        <p>Ajoutez des assurés à cet employeur.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-container">
                        <table class="professional-table" style="margin-top: 24px;">
                            <thead>
                                <tr>
                                    <th>Employé</th>
                                    <th>Salaire Mensuel</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="assure" items="${assures}">
                                    <tr>
                                        <td>
                                            <div class="entity-cell">
                                                <div class="entity-avatar" style="background-color: var(--info-bg); color: var(--info-text);">
                                                    ${assure.nom.substring(0,2).toUpperCase()}
                                                </div>
                                                <div>
                                                    <strong>${assure.nom}</strong>
                                                    <div style="font-size: 0.75rem; color: var(--text-muted);">ID: #${assure.id}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="td-money">${assure.salaireMensuel} MAD</td>
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
