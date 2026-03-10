<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="${empty employeur ? 'Nouvel Employeur' : 'Modifier Employeur'}"/>
    <jsp:param name="active" value="employeurs"/>
</jsp:include>

    <div class="page-header">
        <div>
            <h1 class="page-title">${empty employeur ? 'Nouvel Employeur' : 'Modifier Employeur'}</h1>
            <p class="card-subtitle">${empty employeur ? 'Enregistrer un nouvel employeur' : 'Modifier les informations'}</p>
        </div>
        <a href="${pageContext.request.contextPath}/employeurs" class="btn btn-outline">Retour</a>
    </div>
    
    <div class="card">
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/employeurs">
                <c:if test="${not empty employeur}">
                    <input type="hidden" name="id" value="${employeur.id}"/>
                </c:if>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-bottom: 24px;">
                    <div>
                        <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Raison Sociale *</label>
                        <input type="text" name="raisonSociale" 
                               style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit;"
                               value="${employeur.raisonSociale}" required placeholder="Nom de l'entreprise"/>
                    </div>
                    <div>
                        <label style="display: block; font-weight: 500; font-size: 0.875rem; margin-bottom: 8px;">Secteur d'Activité</label>
                        <input type="text" name="secteurActivite" 
                               style="width: 100%; padding: 12px; border: 1px solid var(--border-color); border-radius: var(--radius-sm); font-family: inherit;"
                               value="${employeur.secteurActivite}" placeholder="ex: Industrie, Services..."/>
                    </div>
                </div>

                <div style="display: flex; gap: 12px; justify-content: flex-end; padding-top: 16px; border-top: 1px solid var(--border-color);">
                    <a href="${pageContext.request.contextPath}/employeurs" class="btn btn-outline">Annuler</a>
                    <button type="submit" class="btn btn-primary">
                        ${empty employeur ? 'Enregistrer' : 'Mettre à jour'}
                    </button>
                </div>
            </form>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp"/>
