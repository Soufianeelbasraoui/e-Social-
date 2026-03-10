<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Cotisations"/>
    <jsp:param name="active" value="cotisations"/>
</jsp:include>
    <div class="page-header">
        <div>
            <h1 class="page-title">Cotisations Sociales</h1>
            <p class="card-subtitle">Taux salarial: ${tauxSalarial}% | Taux patronal: ${tauxPatronal}% | Plafond: ${plafond} MAD</p>
        </div>
        <div style="display: flex; gap: 12px; align-items: center;">
            <form method="get" action="${pageContext.request.contextPath}/cotisations" style="display: flex; gap: 8px;">
                <select name="employeurId" style="padding: 8px 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit; font-size: 0.875rem;">
                    <option value="">Tous les employeurs</option>
                    <c:forEach var="emp" items="${employeurs}">
                        <option value="${emp.id}" ${param.employeurId == emp.id ? 'selected' : ''}>${emp.raisonSociale}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-outline" style="padding: 8px 12px;">Filtrer</button>
            </form>
        </div>
    </div>

    <c:if test="${not empty selectedEmployeur}">
        <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px; margin-bottom: 24px;">
            <div class="card" style="margin-bottom: 0;">
                <div class="card-body">
                    <span class="stat-label">Employeur sélectionné</span>
                    <div class="stat-value" style="font-size: 1.25rem;">${selectedEmployeur.raisonSociale}</div>
                </div>
            </div>
            <div class="card" style="margin-bottom: 0;">
                <div class="card-body">
                    <span class="stat-label">Total des Cotisations</span>
                    <div class="stat-value" style="font-size: 1.25rem; color: var(--primary);"><fmt:formatNumber value="${totalCotisations}" maxFractionDigits="2"/> MAD</div>
                </div>
            </div>
        </div>
    </c:if>

    <div class="card">
        <div class="card-body" style="padding: 0;">
            <c:choose>
                <c:when test="${empty cotisations}">
                    <div style="text-align: center; padding: 48px; color: var(--text-muted);">
                        <svg style="width: 48px; height: 48px; color: var(--text-light); margin: 0 auto 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                        <h4>Aucune cotisation</h4>
                        <p>Les cotisations sont calculées automatiquement lors des déclarations.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-container">
                        <table class="professional-table">
                            <thead>
                                <tr>
                                    <th>Assuré</th>
                                    <th>Période</th>
                                    <th>Salaire Brut</th>
                                    <th>Cot. Salariale</th>
                                    <th>Cot. Patronale</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cot" items="${cotisations}">
                                    <tr>
                                        <td><strong>${cot.assure.nom}</strong></td>
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
                </c:otherwise>
            </c:choose>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp"/>
