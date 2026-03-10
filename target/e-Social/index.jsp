<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/jsp/common/header.jsp">
    <jsp:param name="title" value="Tableau de Bord"/>
    <jsp:param name="active" value="dashboard"/>
</jsp:include>

    <div class="page-header">
        <h1 class="page-title">Dashboard Overview</h1>
    </div>

    <!-- Stats Summary Section -->
    <div class="stats-grid">
        <!-- Card 1 -->
        <div class="stat-card">
            <div class="stat-header">
                <div class="stat-icon" style="background-color: var(--info-bg); color: var(--info-text);">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></svg>
                </div>
                <div class="stat-trend up">
                    <svg style="width:12px; height:12px; display:inline; margin-right:2px;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path></svg>
                    +2.4%
                </div>
            </div>
            <span class="stat-label">Total Employeurs</span>
            <div class="stat-value" data-target="${employeurCount}">0</div>
            <div class="stat-bar">
                <div class="stat-bar-fill" style="width: 70%; background-color: var(--secondary-blue);"></div>
            </div>
        </div>
        
        <!-- Card 2 -->
        <div class="stat-card">
            <div class="stat-header">
                <div class="stat-icon" style="background-color: var(--primary-light); color: var(--primary);">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                </div>
                <div class="stat-trend up">
                    <svg style="width:12px; height:12px; display:inline; margin-right:2px;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path></svg>
                    +5.1%
                </div>
            </div>
            <span class="stat-label">Total Employés</span>
            <div class="stat-value" data-target="${assureCount}">0</div>
            <div class="stat-bar">
                <div class="stat-bar-fill" style="width: 85%; background-color: var(--primary);"></div>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="stat-card">
            <div class="stat-header">
                <div class="stat-icon" style="background-color: var(--warning-bg); color: var(--warning-text);">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                </div>
                <div class="stat-trend neutral">
                    <svg style="width:12px; height:12px; display:inline; margin-right:2px;" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                    0.0%
                </div>
            </div>
            <span class="stat-label">Déclarations Mensuelles</span>
            <div class="stat-value" data-target="${declarationCount}">0</div>
            <div class="stat-bar">
                <div class="stat-bar-fill" style="width: 45%; background-color: var(--warning-text);"></div>
            </div>
        </div>
    </div>

    <!-- Analytics Charts -->
    <div class="charts-grid">
        <!-- Main Chart -->
        <div class="card" style="margin-bottom: 0;">
            <div class="card-header" style="border-bottom: none; padding-bottom: 0;">
                <div>
                    <h3 class="card-title">Monthly Declarations</h3>
                    <p class="card-subtitle">Volume of processing over the last 6 months</p>
                </div>
            </div>
            <div class="card-body">
                <canvas id="declarationsChart" height="100"></canvas>
            </div>
        </div>
        
        <!-- Secondary Chart -->
        <div class="card" style="margin-bottom: 0;">
            <div class="card-header" style="border-bottom: none; padding-bottom: 0;">
                <div>
                    <h3 class="card-title">User Distribution</h3>
                    <p class="card-subtitle">Employers vs Employees</p>
                </div>
            </div>
            <div class="card-body" style="display: flex; justify-content: center;">
                <canvas id="distributionChart" height="200"></canvas>
            </div>
        </div>
    </div>

    <!-- Bottom Chart Row -->
    <div class="card">
        <div class="card-header" style="border-bottom: none; padding-bottom: 0;">
            <div>
                <h3 class="card-title">Contribution Growth</h3>
                <p class="card-subtitle">Revenue trend analysis (K USD)</p>
            </div>
        </div>
        <div class="card-body">
            <canvas id="growthChart" height="60"></canvas>
        </div>
    </div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        // --- 1. Counter Animation ---
        const counters = document.querySelectorAll('.stat-value');
        const speed = 200; // The lower the slower
        
        counters.forEach(counter => {
            const updateCount = () => {
                const target = +counter.getAttribute('data-target') || 0;
                // Treat the target as a number, if string was empty or null it defaults to 0. 
                // Wait for data load visually
                if(target === 0) return; 

                const count = +counter.innerText;
                const inc = target / speed;

                if (count < target) {
                    counter.innerText = Math.ceil(count + inc);
                    setTimeout(updateCount, 15);
                } else {
                    counter.innerText = target;
                }
            };
            updateCount();
        });

        // --- 2. Global Chart Setup ---
        Chart.defaults.font.family = "'Inter', system-ui, -apple-system, sans-serif";
        Chart.defaults.color = "#64748b"; // text-muted
        
        const gridConfig = {
            color: "#e2e8f0", // border-color
            drawBorder: false,
            borderDash: [5, 5]
        };

        // --- Bar Chart: Declarations ---
        const ctxBar = document.getElementById('declarationsChart').getContext('2d');
        new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: ['Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb'],
                datasets: [{
                    label: 'Declarations',
                    data: [120, 190, 150, 220, 180, 250],
                    backgroundColor: '#2563eb', // primary blue
                    borderRadius: 4,
                    barThickness: 32
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                scales: {
                    y: { grid: gridConfig, beginAtZero: true },
                    x: { grid: { display: false } }
                },
                animation: { duration: 2000, easing: 'easeOutQuart' }
            }
        });

        // --- Pie Chart: Users ---
        // Just dummy proportions based on standard metrics
        const empCount = parseInt("${employeurCount}") || 45;
        const assCount = parseInt("${assureCount}") || 215;
        
        const ctxPie = document.getElementById('distributionChart').getContext('2d');
        new Chart(ctxPie, {
            type: 'doughnut',
            data: {
                labels: ['Employers', 'Employees'],
                datasets: [{
                    data: [empCount, assCount],
                    backgroundColor: ['#3b82f6', '#93c5fd'], // secondary blue, light blue
                    borderWidth: 0,
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                cutout: '70%',
                plugins: {
                    legend: { position: 'bottom', labels: { padding: 20, usePointStyle: true } }
                },
                animation: { animateScale: true, animateRotate: true, duration: 1500 }
            }
        });

        // --- Line Chart: Growth ---
        const ctxLine = document.getElementById('growthChart').getContext('2d');
        // Create subtle gradient
        const gradient = ctxLine.createLinearGradient(0, 0, 0, 400);
        gradient.addColorStop(0, 'rgba(37, 99, 235, 0.2)');   // primary light alpha
        gradient.addColorStop(1, 'rgba(37, 99, 235, 0)');

        new Chart(ctxLine, {
            type: 'line',
            data: {
                labels: ['Q1', 'Q2', 'Q3', 'Q4', 'Q1 (Current)'],
                datasets: [{
                    label: 'Contributions',
                    data: [350, 420, 490, 650, 810],
                    borderColor: '#2563eb',
                    backgroundColor: gradient,
                    borderWidth: 3,
                    tension: 0.4, // smooth curve
                    fill: true,
                    pointBackgroundColor: '#ffffff',
                    pointBorderColor: '#2563eb',
                    pointBorderWidth: 2,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                scales: {
                    y: { grid: gridConfig, beginAtZero: true },
                    x: { grid: { display: false } }
                },
                animation: { duration: 2500, easing: 'easeOutQuart' }
            }
        });
    });
</script>

<jsp:include page="/jsp/common/footer.jsp"/>
