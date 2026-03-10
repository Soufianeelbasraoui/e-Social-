<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Ajouter Salaire"/>
    <jsp:param name="active" value="declarations"/>
</jsp:include>

    <main class="main-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">Ajouter un Salaire</h1>
                <p class="page-subtitle">Déclaration #${declaration.id} — ${declaration.employeur.raisonSociale} (${declaration.mois}/${declaration.annee})</p>
            </div>
            <a href="${pageContext.request.contextPath}/declarations?action=details&id=${declaration.id}" class="btn btn-secondary">&#8592; Retour</a>
        </div>
        <div class="page-body">
            <div class="card">
                <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath}/declarations">
                        <input type="hidden" name="action" value="addLigne"/>
                        <input type="hidden" name="declarationId" value="${declaration.id}"/>

                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Assuré *</label>
                                <select name="assureId" class="form-control" required>
                                    <option value="">-- Sélectionner un assuré --</option>
                                    <c:forEach var="assure" items="${assures}">
                                        <option value="${assure.id}">${assure.nom} (${assure.salaireMensuel} MAD)</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Salaire Déclaré (MAD) *</label>
                                <input type="number" name="salaireDeclare" class="form-control" step="0.01"
                                       required placeholder="Montant du salaire"/>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Ajouter le Salaire</button>
                            <a href="${pageContext.request.contextPath}/declarations?action=details&id=${declaration.id}" class="btn btn-secondary">Annuler</a>
                        </div>
                    </form>
                </div>
            </div>

            <div class="alert alert-info mt-3">
                &#128161; La cotisation sera calculée automatiquement lors de l'ajout du salaire.
            </div>
        </div>

<jsp:include page="/jsp/common/footer.jsp"/>
