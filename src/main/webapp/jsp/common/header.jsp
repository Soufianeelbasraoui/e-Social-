<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - e-Social Admin</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Main Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=2.0">
</head>
<body>
    <!-- Sidebar -->
    <aside class="sidebar" style="background: #0f172a;">
        <div class="sidebar-header">
            <div class="brand-container">
                <div class="brand-icon">
                    <svg fill="currentColor" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/></svg>
                </div>
                <div class="brand-text">
                    <span class="brand-title" style="color: #fff">e-Social</span>
                    <span class="brand-subtitle" >Management</span>
                </div>
            </div>
        </div>
        
        <nav class="sidebar-nav">
            <div class="nav-item">
                <a href="${pageContext.request.contextPath}/" class="nav-link ${param.active == 'dashboard' ? 'active' : ''}">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/></svg>
                    Dashboard
                </a>
            </div>
            
            <div class="nav-item" style="margin-top: 16px;">
                <a href="${pageContext.request.contextPath}/employeurs" class="nav-link ${param.active == 'employeurs' ? 'active' : ''}">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></svg>
                    Employers
                </a>
            </div>
            <div class="nav-item">
                <a href="${pageContext.request.contextPath}/assures" class="nav-link ${param.active == 'assures' ? 'active' : ''}">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                    Employees
                </a>
            </div>
            
            <div class="nav-item" style="margin-top: 16px;">
                <a href="${pageContext.request.contextPath}/declarations" class="nav-link ${param.active == 'declarations' ? 'active' : ''}">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                    Declarations
                </a>
            </div>
            <div class="nav-item">
                <a href="${pageContext.request.contextPath}/cotisations" class="nav-link ${param.active == 'cotisations' ? 'active' : ''}">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                    Contributions
                </a>
            </div>
            
            <div class="nav-item" style="margin-top: 16px;">
                <a href="${pageContext.request.contextPath}/droits" class="nav-link ${param.active == 'droits' ? 'active' : ''}">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                    Social Rights
                </a>
            </div>
        </nav>

        <div class="sidebar-user-profile">
            <img src="https://ui-avatars.com/api/?name=Alex+Johnson&background=d1d5db&color=111827" alt="User Avatar" class="sidebar-user-avatar">
            <div class="sidebar-user-info">
                <span class="sidebar-user-name"  style="color: #fff">Alex Johnson</span>
                <span class="sidebar-user-role">System Admin</span>
            </div>
            <div class="sidebar-user-settings">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
            </div>
        </div>
    </aside>
    
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

    <!-- Main Wrapper -->
    <div class="main-wrapper">
        <!-- Navbar -->
        <header class="navbar">
            <div class="navbar-left">
                <div class="header-title-container">
                    <button class="mobile-menu-btn" id="mobileMenuBtn">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
                    </button>
                    <svg class="header-page-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" style="width: 24px; height: 24px;">
                        <c:choose>
                            <c:when test="${param.active == 'employeurs'}"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></c:when>
                            <c:otherwise><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/></c:otherwise>
                        </c:choose>
                    </svg>
                    <span class="header-page-title">${param.title}</span>
                </div>
            </div>
            
            <div class="navbar-right">
                <div class="notification-container" id="notificationContainer">
                    <button class="icon-btn" id="notificationBtn">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
                        <span class="notification-dot"></span>
                    </button>
                    <!-- Dropdown -->
                    <div class="notification-dropdown">
                        <div class="notification-header">
                            <h4>Notifications</h4>
                            <span class="notification-mark-read">Mark all as read</span>
                        </div>
                        <div class="notification-list">
                            <div class="notification-item unread">
                                <button class="notification-close"><svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg></button>
                                <div class="notification-avatar" style="background-color: var(--success-bg); color: var(--success-text);">
                                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                                </div>
                                <div class="notification-content">
                                    <span class="notification-text"><strong>Global Tech Solutions</strong> declaration processed successfully.</span>
                                    <span class="notification-time">2 minutes ago</span>
                                </div>
                            </div>
                            <div class="notification-item unread">
                                <button class="notification-close"><svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg></button>
                                <div class="notification-avatar" style="background-color: var(--warning-bg); color: var(--warning-text);">
                                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                                </div>
                                <div class="notification-content">
                                    <span class="notification-text">Warning: Contributions missing for <strong>Sunrise Manufacturing</strong>.</span>
                                    <span class="notification-time">1 hour ago</span>
                                </div>
                            </div>
                            <div class="notification-item">
                                <button class="notification-close"><svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg></button>
                                <div class="notification-avatar" style="background-color: var(--info-bg); color: var(--info-text);">
                                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/></svg>
                                </div>
                                <div class="notification-content">
                                    <span class="notification-text">New employee registered: <strong>Sarah Connor</strong></span>
                                    <span class="notification-time">3 hours ago</span>
                                </div>
                            </div>
                        </div>
                        <div class="notification-footer">
                            <a href="#">View All Notifications</a>
                        </div>
                    </div>
                </div>
                <button class="icon-btn">
                    <svg fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 17h-2v-2h2v2zm2.07-7.75l-.9.92C13.45 12.9 13 13.5 13 15h-2v-.5c0-1.1.45-2.1 1.17-2.83l1.24-1.26c.37-.36.59-.86.59-1.41 0-1.1-.9-2-2-2s-2 .9-2 2H8c0-2.21 1.79-4 4-4s4 1.79 4 4c0 .88-.36 1.68-.93 2.25z"/></svg>
                </button>
            </div>
        </header>

        <!-- Content -->
        <main class="content">
        
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                // Mobile Sidebar Toggle
                const mobileMenuBtn = document.getElementById('mobileMenuBtn');
                const sidebar = document.querySelector('.sidebar');
                const sidebarOverlay = document.getElementById('sidebarOverlay');
                
                if(mobileMenuBtn && sidebar && sidebarOverlay) {
                    const toggleSidebar = () => {
                        sidebar.classList.toggle('show');
                        sidebarOverlay.classList.toggle('show');
                    };
                    
                    mobileMenuBtn.addEventListener('click', toggleSidebar);
                    sidebarOverlay.addEventListener('click', toggleSidebar);
                }

                // Notifications Toggle
                const notifBtn = document.getElementById('notificationBtn');
                const notifContainer = document.getElementById('notificationContainer');
                
                if (notifBtn && notifContainer) {
                    notifBtn.addEventListener('click', (e) => {
                        e.stopPropagation();
                        notifContainer.classList.toggle('open');
                    });
                    
                    document.addEventListener('click', (e) => {
                        if (!notifContainer.contains(e.target)) {
                            notifContainer.classList.remove('open');
                        }
                    });
                }
                
                // Notification dismiss functionality
                const closeBtns = document.querySelectorAll('.notification-close');
                closeBtns.forEach(btn => {
                    btn.addEventListener('click', (e) => {
                        e.stopPropagation(); // prevent triggering other clicks
                        const item = e.target.closest('.notification-item');
                        if (item) {
                            item.style.opacity = '0';
                            setTimeout(() => {
                                item.remove();
                                // Optional: Update notification dot logic here
                            }, 200);
                        }
                    });
                });
            });
        </script>
