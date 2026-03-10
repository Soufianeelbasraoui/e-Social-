<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Employeurs"/>
    <jsp:param name="active" value="employeurs"/>
</jsp:include>

    <div class="toolbar-card">
        <div class="search-input-group">
            <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
            <input type="text" placeholder="Search by business name or ID...">
        </div>
        <a href="${pageContext.request.contextPath}/employeurs?action=form" class="btn btn-primary">
            <svg style="width: 20px; height: 20px;" fill="currentColor" viewBox="0 0 24 24"><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/></svg>
            Add Employer
        </a>
    </div>
    <div class="card">
        <div class="card-body" style="padding: 0;">
            <c:choose>
                <c:when test="${empty employeurs}">
                    <div style="text-align: center; padding: 48px; color: var(--text-muted);">
                        <svg style="width: 48px; height: 48px; color: var(--text-light); margin: 0 auto 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></svg>
                        <h4>Aucun employeur enregistré</h4>
                        <p>Commencez par ajouter un employeur.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-container">
                        <table class="professional-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>BUSINESS NAME (RAISON SOCIALE)</th>
                                    <th>ACTIVITY SECTOR</th>
                                    <th class="text-right">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="emp" items="${employeurs}">
                                    <tr>
                                        <td style="color: var(--text-muted);">EMP-<c:out value="${String.format('%03d', emp.id)}" /></td>
                                        <td>
                                            <div class="entity-cell">
                                                <div class="entity-avatar" style="background-color: var(--primary-light); color: var(--primary);">
                                                    ${fn:substring(fn:toUpperCase(emp.raisonSociale), 0, 2)}
                                                </div>
                                                <strong style="color: var(--text-dark);">${emp.raisonSociale}</strong>
                                            </div>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${fn:containsIgnoreCase(emp.secteurActivite, 'IT') or fn:containsIgnoreCase(emp.secteurActivite, 'Tech')}">
                                                    <span class="status-badge badge-it">${emp.secteurActivite}</span>
                                                </c:when>
                                                <c:when test="${fn:containsIgnoreCase(emp.secteurActivite, 'Industrie') or fn:containsIgnoreCase(emp.secteurActivite, 'Manufacturing')}">
                                                    <span class="status-badge badge-industrial">${emp.secteurActivite}</span>
                                                </c:when>
                                                <c:when test="${fn:containsIgnoreCase(emp.secteurActivite, 'Santé') or fn:containsIgnoreCase(emp.secteurActivite, 'Médical') or fn:containsIgnoreCase(emp.secteurActivite, 'Medical')}">
                                                    <span class="status-badge badge-medical">${emp.secteurActivite}</span>
                                                </c:when>
                                                <c:when test="${fn:containsIgnoreCase(emp.secteurActivite, 'Transport') or fn:containsIgnoreCase(emp.secteurActivite, 'Logistics')}">
                                                    <span class="status-badge badge-logistics">${emp.secteurActivite}</span>
                                                </c:when>
                                                <c:when test="${fn:containsIgnoreCase(emp.secteurActivite, 'Commerce') or fn:containsIgnoreCase(emp.secteurActivite, 'Retail')}">
                                                    <span class="status-badge badge-retail">${emp.secteurActivite}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge badge-default">${emp.secteurActivite}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-right">
                                            <a href="${pageContext.request.contextPath}/employeurs?action=details&id=${emp.id}" style="color: var(--primary); font-weight: 600; font-size: 0.875rem; text-decoration: none; display: inline-flex; align-items: center; justify-content: flex-end; gap: 4px;">
                                                View Details
                                                <svg style="width: 16px; height: 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"/></svg>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        <div class="table-footer">
                            <span>Showing 1 to ${fn:length(employeurs)} of 24 entries</span>
                            <div class="pagination">
                                <button class="page-btn"><svg style="width: 16px; height: 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/></svg></button>
                                <button class="page-btn active">1</button>
                                <button class="page-btn">2</button>
                                <button class="page-btn">3</button>
                                <button class="page-btn"><svg style="width: 16px; height: 16px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/></svg></button>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

<jsp:include page="/jsp/common/footer.jsp"/>

