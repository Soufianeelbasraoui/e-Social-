<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Détails Déclaration"/>
    <jsp:param name="active" value="declarations"/>
</jsp:include>

    <main class="main-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">Déclaration #${declaration.id}</h1>
                <p class="page-subtitle">${declaration.employeur.raisonSociale} — ${declaration.mois}/${declaration.annee}</p>
            </div>
            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/declarations?action=addLigne&declarationId=${declaration.id}" class="btn btn-success">+ Ajouter Salaire</a>
                <a href="${pageContext.request.contextPath}/declarations" class="btn btn-secondary">&#8592; Retour</a>
            </div>
        </div>
        <div class="page-body">
            <div class="info-grid mb-3">
                <div class="info-item">
                    <div class="label">Employeur</div>
                    <div class="value">${declaration.employeur.raisonSociale}</div>
                </div>
                <div class="info-item">
                    <div class="label">Période</div>
                    <div class="value">${declaration.mois} / ${declaration.annee}</div>
                </div>
                <div class="info-item">
                    <div class="label">Date de Déclaration</div>
                    <div class="value">${declaration.dateDeclaration}</div>
                </div>
            </div>

            <!-- Lignes de Déclaration -->
            <div class="card mb-3">
                <div class="card-header">
                    <h3>Salaires Déclarés</h3>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty lignes}">
                            <div class="empty-state">
                                <div class="icon">&#128176;</div>
                                <h4>Aucun salaire déclaré</h4>
                                <p>Ajoutez les salaires des employés à cette déclaration.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Assuré</th>
                                            <th>Salaire Déclaré</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="ligne" items="${lignes}">
                                            <tr>
                                                <td class="fw-bold">${ligne.assure.nom}</td>
                                                <td>${ligne.salaireDeclare} MAD</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Cotisations -->
            <div class="card">
                <div class="card-header">
                    <h3>Cotisations Calculées</h3>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty cotisations}">
                            <div class="empty-state">
                                <div class="icon">&#128202;</div>
                                <h4>Aucune cotisation</h4>
                                <p>Les cotisations seront calculées automatiquement.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Assuré</th>
                                            <th>Salaire Brut</th>
                                            <th>Cot. Salariale</th>
                                            <th>Cot. Patronale</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="totalSal" value="0"/>
                                        <c:set var="totalPat" value="0"/>
                                        <c:forEach var="cot" items="${cotisations}">
                                            <tr>
                                                <td class="fw-bold">${cot.assure.nom}</td>
                                                <td>${cot.salaireBrut} MAD</td>
                                                <td><fmt:formatNumber value="${cot.cotisationSalariale}" maxFractionDigits="2"/> MAD</td>
                                                <td><fmt:formatNumber value="${cot.cotisationPatronale}" maxFractionDigits="2"/> MAD</td>
                                                <td class="fw-bold"><fmt:formatNumber value="${cot.total}" maxFractionDigits="2"/> MAD</td>
                                            </tr>
                                            <c:set var="totalSal" value="${totalSal + cot.cotisationSalariale}"/>
                                            <c:set var="totalPat" value="${totalPat + cot.cotisationPatronale}"/>
                                        </c:forEach>
                                        <tr style="background:#f0f9ff;font-weight:700;">
                                            <td>TOTAL</td>
                                            <td></td>
                                            <td><fmt:formatNumber value="${totalSal}" maxFractionDigits="2"/> MAD</td>
                                            <td><fmt:formatNumber value="${totalPat}" maxFractionDigits="2"/> MAD</td>
                                            <td class="text-primary"><fmt:formatNumber value="${totalSal + totalPat}" maxFractionDigits="2"/> MAD</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

<jsp:include page="/jsp/common/footer.jsp"/>
