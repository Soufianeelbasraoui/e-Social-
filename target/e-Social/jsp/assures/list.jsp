<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Assurés"/>
    <jsp:param name="active" value="assures"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">Gestion des Assurés</h1>
            <p class="card-subtitle">Liste de tous les assurés (employés déclarés)</p>
        </div>
        <div style="display: flex; gap: 12px; align-items: center;">
            <form method="get" action="${pageContext.request.contextPath}/assures" style="display: flex; gap: 8px;">
                <select name="employeurId" style="padding: 8px 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit; font-size: 0.875rem;">
                    <option value="">Tous les employeurs</option>
                    <c:forEach var="emp" items="${employeurs}">
                        <option value="${emp.id}" ${param.employeurId == emp.id ? 'selected' : ''}>${emp.raisonSociale}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-outline" style="padding: 8px 12px;">Filtrer</button>
            </form>
            <a href="${pageContext.request.contextPath}/assures?action=form" class="btn btn-primary">+ Nouvel Assuré</a>
        </div>
    </div>
    
    <div class="card">
        <div class="card-body" style="padding: 0;">
            <c:choose>
                <c:when test="${empty assures}">
                    <div style="text-align: center; padding: 48px; color: var(--text-muted);">
                        <svg style="width: 48px; height: 48px; color: var(--text-light); margin: 0 auto 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                        <h4>Aucun assuré enregistré</h4>
                        <p>Ajoutez des employés pour commencer.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-container">
                        <table class="professional-table">
                            <thead>
                                <tr>
                                    <th>Employé</th>
                                    <th>Salaire Mensuel</th>
                                    <th>Employeur</th>
                                    <th class="text-right">Actions</th>
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
                                        <td>${assure.employeur.raisonSociale}</td>
                                        <td class="text-right">
                                            <div style="display: flex; gap: 8px; justify-content: flex-end;">
                                                <a href="${pageContext.request.contextPath}/assures?action=form&id=${assure.id}" class="btn btn-outline" style="padding: 6px 12px; border-color: var(--warning-text); color: var(--warning-text);">Modifier</a>
                                                <a href="${pageContext.request.contextPath}/assures?action=delete&id=${assure.id}" class="btn btn-outline" style="padding: 6px 12px; border-color: var(--danger-text); color: var(--danger-text);" onclick="return confirm('Supprimer cet assuré ?')">Supprimer</a>
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
