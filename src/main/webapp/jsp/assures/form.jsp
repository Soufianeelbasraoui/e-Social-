<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="${empty assure ? 'Nouvel Assuré' : 'Modifier Assuré'}"/>
    <jsp:param name="active" value="assures"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">${empty assure ? 'Nouvel Assuré' : 'Modifier Assuré'}</h1>
            <p class="card-subtitle">${empty assure ? 'Enregistrer un nouvel employé' : 'Modifier les informations'}</p>
        </div>
        <a href="${pageContext.request.contextPath}/assures" class="btn btn-outline">Retour</a>
    </div>

    <div class="card">
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/assures">
                <c:if test="${not empty assure}">
                    <input type="hidden" name="id" value="${assure.id}"/>
                </c:if>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-bottom: 24px;">
                    <div>
                        <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Nom Complet *</label>
                        <input type="text" name="nom" 
                               style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit;"
                               value="${assure.nom}" required placeholder="Nom de l'employé"/>
                    </div>
                    <div>
                        <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Salaire Mensuel (MAD) *</label>
                        <input type="number" name="salaireMensuel" step="0.01"
                               style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit;"
                               value="${assure.salaireMensuel}" required placeholder="ex: 5000"/>
                    </div>
                </div>
                
                <div style="margin-bottom: 24px;">
                    <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Employeur *</label>
                    <select name="employeurId" required style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit; background-color: var(--card-bg);">
                        <option value="">-- Sélectionner un employeur --</option>
                        <c:forEach var="emp" items="${employeurs}">
                            <option value="${emp.id}"
                                ${(not empty assure && assure.employeur.id == emp.id) ? 'selected' : ''}
                                ${(empty assure && param.defaultEmployeur == emp.id) ? 'selected' : ''}>
                                ${emp.raisonSociale}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div style="display: flex; gap: 12px; justify-content: flex-end; padding-top: 16px; border-top: 1px solid var(--border-color);">
                    <a href="${pageContext.request.contextPath}/assures" class="btn btn-outline">Annuler</a>
                    <button type="submit" class="btn btn-primary">
                        ${empty assure ? 'Enregistrer' : 'Mettre à jour'}
                    </button>
                </div>
            </form>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp"/>
