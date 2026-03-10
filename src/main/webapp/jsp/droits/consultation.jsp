<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Droits Sociaux"/>
    <jsp:param name="active" value="droits"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">Consultation des Droits Sociaux</h1>
            <p class="card-subtitle">Vérifiez les droits acquis d'un assuré</p>
        </div>
    </div>
    
    <div class="card mb-3">
        <div class="card-body">
            <form method="get" action="${pageContext.request.contextPath}/droits" style="display:flex;gap:12px;align-items:center;">
                <select name="assureId" required style="flex: 1; max-width: 400px; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit;">
                    <option value="">-- Sélectionner un assuré --</option>
                    <c:forEach var="assure" items="${assures}">
                        <option value="${assure.id}" ${selectedAssureId == assure.id ? 'selected' : ''}>
                            ${assure.nom} (${assure.employeur.raisonSociale})
                        </option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary" style="padding: 12px 24px;">Consulter</button>
            </form>
        </div>
    </div>

    <c:if test="${not empty error}">
        <div class="alert alert-danger" style="margin-bottom: 24px;">&#9888; ${error}</div>
    </c:if>

    <c:if test="${not empty droits}">
        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; margin-bottom: 24px;">
            <div class="card" style="margin-bottom: 0;">
                <div class="card-body">
                    <span class="stat-label">Nom de l'Assuré</span>
                    <div class="stat-value" style="font-size: 1.25rem;">${droits.assure.nom}</div>
                </div>
            </div>
            <div class="card" style="margin-bottom: 0;">
                <div class="card-body">
                    <span class="stat-label">Employeur</span>
                    <div class="stat-value" style="font-size: 1.25rem;">${droits.assure.employeur.raisonSociale}</div>
                </div>
            </div>
            <div class="card" style="margin-bottom: 0;">
                <div class="card-body">
                    <span class="stat-label">Salaire Actuel</span>
                    <div class="stat-value" style="font-size: 1.25rem; color: var(--primary);">${droits.assure.salaireMensuel} MAD</div>
                </div>
            </div>
        </div>

        <div class="stats-grid mb-3">
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon" style="background-color: var(--secondary-blue); color: white;">
                        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                    </div>
                </div>
                <span class="stat-label">Nombre de Mois Déclarés</span>
                <div class="stat-value">${droits.nombreMoisDeclares}</div>
                <div class="stat-bar"><div class="stat-bar-fill" style="width: ${(droits.nombreMoisDeclares / 54) * 100}%; background-color: var(--secondary-blue);"></div></div>
            </div>
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon" style="background-color: var(--success); color: white;">
                        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                    </div>
                </div>
                <span class="stat-label">Total des Cotisations</span>
                <div class="stat-value"><fmt:formatNumber value="${droits.totalCotisations}" maxFractionDigits="2"/> MAD</div>
                <div class="stat-bar"><div class="stat-bar-fill" style="width: 100%; background-color: var(--success);"></div></div>
            </div>
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon" style="background-color: var(--primary); color: white;">
                        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                    </div>
                </div>
                <span class="stat-label">Statut des Droits</span>
                <div class="stat-value" style="font-size: 1.25rem;">
                    <c:choose>
                        <c:when test="${droits.nombreMoisDeclares >= 54}"><span style="color: var(--success);">Actif (Droits Acquis)</span></c:when>
                        <c:when test="${droits.nombreMoisDeclares > 0}"><span style="color: var(--warning-text);">En cours (${54 - droits.nombreMoisDeclares} mois restants)</span></c:when>
                        <c:otherwise><span style="color: var(--danger-text);">Inactif</span></c:otherwise>
                    </c:choose>
                </div>
                <div class="stat-bar"><div class="stat-bar-fill" style="width: 100%; background-color: var(--primary);"></div></div>
            </div>
        </div>

        <c:if test="${not empty droits.cotisations}">
            <div class="card">
                <div class="card-header" style="border-bottom: none; padding-bottom: 0;">
                    <h3 class="card-title">Historique des Cotisations</h3>
                </div>
                <div class="card-body" style="padding: 0;">
                    <div class="table-container">
                        <table class="professional-table" style="margin-top: 24px;">
                            <thead>
                                <tr>
                                    <th>Période</th>
                                    <th>Salaire Brut</th>
                                    <th>Cot. Salariale</th>
                                    <th>Cot. Patronale</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cot" items="${droits.cotisations}">
                                    <tr>
                                        <td><span class="status-badge badge-primary">${cot.mois}/${cot.annee}</span></td>
                                        <td class="td-money">${cot.salaireBrut} MAD</td>
                                        <td class="td-money"><fmt:formatNumber value="${cot.cotisationSalariale}" maxFractionDigits="2"/> MAD</td>
                                        <td class="td-money"><fmt:formatNumber value="${cot.cotisationPatronale}" maxFractionDigits="2"/> MAD</td>
                                        <td class="td-money" style="font-weight: 600; color: var(--primary);"><fmt:formatNumber value="${cot.total}" maxFractionDigits="2"/> MAD</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </c:if>

<jsp:include page="/jsp/common/footer.jsp"/>
