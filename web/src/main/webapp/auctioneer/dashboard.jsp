<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/24/2025
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Auctioneer Dashboard - Luxe Auctions
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auctioneer Dashboard | Luxe Auctions</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#111111',
                        secondary: '#2F2F2F',
                        light: '#F6F6F6',
                        accent: '#FFCB74',
                        success: '#10B981',
                        warning: '#F59E0B',
                        danger: '#EF4444'
                    }
                }
            }
        }
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .glass-panel {
            background: rgba(246, 246, 246, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 203, 116, 0.1);
        }
        .hover-glow:hover {
            box-shadow: 0 0 15px rgba(255, 203, 116, 0.3);
        }
    </style>
</head>
<body class="bg-primary text-light min-h-screen">
<!-- Header -->
<header class="bg-secondary border-b border-accent/20">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <div class="flex items-center space-x-3">
            <i class="fas fa-gavel text-accent text-2xl"></i>
            <h1 class="text-xl font-bold">LUXE AUCTIONS <span class="text-accent">|</span> <span class="text-light/70">Auctioneer Panel</span></h1>
        </div>
        <div class="flex items-center space-x-6">
            <div class="relative group">
                <button class="p-2 rounded-full hover:bg-accent/10">
                    <i class="fas fa-bell text-light/70 hover:text-accent"></i>
                    <span class="absolute top-0 right-0 bg-danger rounded-full w-2 h-2"></span>
                </button>
            </div>
            <div class="flex items-center space-x-2">
                <div class="w-8 h-8 rounded-full bg-accent/10 border border-accent/30 flex items-center justify-center">
                    <i class="fas fa-user text-accent"></i>
                </div>
                <span class="font-medium">${sessionScope.username}</span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="text-light/70 hover:text-accent">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="flex flex-col md:flex-row">
    <!-- Sidebar -->
    <nav class="bg-secondary w-full md:w-64 p-4 border-r border-accent/10">
        <ul class="space-y-2">
            <li>
                <a href="#dashboard" class="flex items-center space-x-3 p-3 rounded-lg bg-accent/10 text-accent">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#create-auction" class="flex items-center space-x-3 p-3 rounded-lg hover:bg-accent/10 hover:text-accent transition">
                    <i class="fas fa-plus-circle"></i>
                    <span>Create Auction</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center space-x-3 p-3 rounded-lg hover:bg-accent/10 hover:text-accent transition">
                    <i class="fas fa-gavel"></i>
                    <span>Manage Auctions</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center space-x-3 p-3 rounded-lg hover:bg-accent/10 hover:text-accent transition">
                    <i class="fas fa-users"></i>
                    <span>Bidders</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center space-x-3 p-3 rounded-lg hover:bg-accent/10 hover:text-accent transition">
                    <i class="fas fa-chart-line"></i>
                    <span>Analytics</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center space-x-3 p-3 rounded-lg hover:bg-accent/10 hover:text-accent transition">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Dashboard Content -->
    <!-- Replace the entire <main> section with: -->
    <main class="flex-1 p-6" id="main-content">
        <jsp:include page="content/dashboard-content.jsp" />
    </main>
</div>

<!-- Countdown Timer Script -->
<script>
    // Working Countdown Timer Implementation
    function updateCountdowns() {
        const now = new Date().getTime();

        document.querySelectorAll('.countdown-timer').forEach(timer => {
            const endTime = new Date(timer.dataset.end).getTime();
            const distance = endTime - now;

            // If auction ended
            if (distance < 0) {
                timer.innerHTML = "Ended";
                timer.classList.add('text-danger');
                return;
            }

            // Calculate time remaining
            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

            // Display the result
            if (days > 0) {
                timer.innerHTML = `${days}d ${hours}h`;
            } else if (hours > 0) {
                timer.innerHTML = `${hours}h ${minutes}m`;
            } else {
                timer.innerHTML = `${minutes}m`;
            }
        });
    }

    // Initialize and update every minute
    document.addEventListener('DOMContentLoaded', function() {
        updateCountdowns();
        setInterval(updateCountdowns, 60000);
    });


    function loadContent(url) {
        fetch(url)
            .then(response => response.text())
            .then(html => {
                document.getElementById('main-content').innerHTML = html;
                // Reinitialize any scripts needed for the loaded content
                if (url.includes('add-auction')) {
                    initAuctionForm();
                } else {
                    updateCountdowns();
                }
            });
    }

    // Initialize auction form (if loaded)
    function initAuctionForm() {
        // Form validation or other initialization for the auction form
        console.log("Auction form initialized");
    }

    // Set up click handlers for navigation
    document.addEventListener('DOMContentLoaded', function() {
        // Dashboard link
        document.querySelector('a[href="#dashboard"]').addEventListener('click', function(e) {
            e.preventDefault();
            loadContent('content/dashboard-content.jsp');
        });

        // Create Auction links (both sidebar and button)
        document.querySelectorAll('a[href="#create-auction"], button.create-auction-btn').forEach(el => {
            el.addEventListener('click', function(e) {
                e.preventDefault();
                loadContent('content/add-auction-content.jsp');
            });
        });
    });
</script>
</body>
</html>
