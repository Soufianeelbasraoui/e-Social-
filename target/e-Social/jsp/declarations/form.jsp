<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Nouvelle Déclaration"/>
    <jsp:param name="active" value="declarations"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">Nouvelle Déclaration</h1>
            <p class="card-subtitle">Créer une déclaration mensuelle de salaires</p>
        </div>
        <a href="${pageContext.request.contextPath}/declarations" class="btn btn-outline">Retour</a>
    </div>

    <c:if test="${not empty error}">
        <div class="alert alert-danger" style="margin-bottom: 24px;">&#9888; ${error}</div>
    </c:if>

    <div class="card">
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/declarations">
                <div style="margin-bottom: 24px;">
                    <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Employeur *</label>
                    <select name="employeurId" required style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit; background-color: var(--card-bg);">
                        <option value="">-- Sélectionner un employeur --</option>
                        <c:forEach var="emp" items="${employeurs}">
                            <option value="${emp.id}">${emp.raisonSociale}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-bottom: 24px;">
                    <div>
                        <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Mois *</label>
                        <select name="mois" required style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit; background-color: var(--card-bg);">
                            <option value="1">Janvier</option>
                            <option value="2">Février</option>
                            <option value="3">Mars</option>
                            <option value="4">Avril</option>
                            <option value="5">Mai</option>
                            <option value="6">Juin</option>
                            <option value="7">Juillet</option>
                            <option value="8">Août</option>
                            <option value="9">Septembre</option>
                            <option value="10">Octobre</option>
                            <option value="11">Novembre</option>
                            <option value="12">Décembre</option>
                        </select>
                    </div>
                    <div>
                        <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Année *</label>
                        <input type="number" name="annee" value="2026" min="2020" max="2030" required
                               style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit;"/>
                    </div>
                </div>
                
                <div style="display: flex; gap: 12px; justify-content: flex-end; padding-top: 16px; border-top: 1px solid var(--border-color);">
                    <a href="${pageContext.request.contextPath}/declarations" class="btn btn-outline">Annuler</a>
                    <button type="submit" class="btn btn-primary">Créer la Déclaration</button>
                </div>
            </form>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp"/>
