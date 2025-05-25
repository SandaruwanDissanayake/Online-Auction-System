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
                <a href="#" class="flex items-center space-x-3 p-3 rounded-lg bg-accent/10 text-accent">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center space-x-3 p-3 rounded-lg hover:bg-accent/10 hover:text-accent transition">
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
    <main class="flex-1 p-6">
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="glass-panel rounded-xl p-6 hover-glow transition">
                <div class="flex justify-between items-start">
                    <div>
                        <p class="text-light/70">Active Auctions</p>
                        <p class="text-3xl font-bold mt-1">12</p>
                    </div>
                    <div class="bg-accent/10 p-3 rounded-lg text-accent">
                        <i class="fas fa-gavel text-xl"></i>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                    <i class="fas fa-arrow-up mr-1"></i> 3 new today
                </div>
            </div>

            <div class="glass-panel rounded-xl p-6 hover-glow transition">
                <div class="flex justify-between items-start">
                    <div>
                        <p class="text-light/70">Total Bids</p>
                        <p class="text-3xl font-bold mt-1">247</p>
                    </div>
                    <div class="bg-success/10 p-3 rounded-lg text-success">
                        <i class="fas fa-hand-holding-usd text-xl"></i>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                    <i class="fas fa-arrow-up mr-1"></i> 42 today
                </div>
            </div>

            <div class="glass-panel rounded-xl p-6 hover-glow transition">
                <div class="flex justify-between items-start">
                    <div>
                        <p class="text-light/70">Revenue</p>
                        <p class="text-3xl font-bold mt-1">$184,750</p>
                    </div>
                    <div class="bg-warning/10 p-3 rounded-lg text-warning">
                        <i class="fas fa-coins text-xl"></i>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                    <i class="fas fa-arrow-up mr-1"></i> 12% this week
                </div>
            </div>

            <div class="glass-panel rounded-xl p-6 hover-glow transition">
                <div class="flex justify-between items-start">
                    <div>
                        <p class="text-light/70">Registered Bidders</p>
                        <p class="text-3xl font-bold mt-1">1,248</p>
                    </div>
                    <div class="bg-blue-400/10 p-3 rounded-lg text-blue-400">
                        <i class="fas fa-users text-xl"></i>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-light/10 text-sm text-success">
                    <i class="fas fa-arrow-up mr-1"></i> 28 new today
                </div>
            </div>
        </div>

        <!-- Active Auctions Table -->
        <section class="mb-8">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-bold">
                    <i class="fas fa-gavel text-accent mr-2"></i> Active Auctions
                </h2>
                <button class="bg-accent hover:bg-accent/90 text-primary px-4 py-2 rounded-lg flex items-center">
                    <i class="fas fa-plus mr-2"></i> New Auction
                </button>
            </div>

            <div class="glass-panel rounded-xl overflow-hidden">
                <table class="min-w-full divide-y divide-light/10">
                    <thead class="bg-secondary">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Item</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Time Left</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Current Bid</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Bids</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Status</th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-light/50 uppercase tracking-wider">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-light/10">
                    <!-- Auction 1 -->
                    <tr class="hover:bg-secondary/50 transition">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10 rounded-md object-cover" src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80" alt="">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium">Vintage Rolex Watch</div>
                                    <div class="text-xs text-light/50">Lot #VR-1965-42</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm countdown-timer" data-end="2025-06-15T14:30:00">2d 4h 32m</div>
                            <div class="w-full bg-light/20 rounded-full h-1 mt-1">
                                <div class="bg-accent h-full rounded-full" style="width: 65%"></div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                            $12,450
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            24
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-success/10 text-success">
                                        Active
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="flex justify-end space-x-2">
                                <button class="text-accent hover:text-accent/80 p-1">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="text-light/70 hover:text-danger p-1">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Auction 2 -->
                    <tr class="hover:bg-secondary/50 transition">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10 rounded-md object-cover" src="https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1705&q=80" alt="">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium">Abstract Oil Painting</div>
                                    <div class="text-xs text-light/50">Lot #AP-2023-15</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm countdown-timer" data-end="2025-06-14T18:00:00">1d 8h 15m</div>
                            <div class="w-full bg-light/20 rounded-full h-1 mt-1">
                                <div class="bg-accent h-full rounded-full" style="width: 45%"></div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                            $8,200
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            18
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-success/10 text-success">
                                        Active
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="flex justify-end space-x-2">
                                <button class="text-accent hover:text-accent/80 p-1">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="text-light/70 hover:text-danger p-1">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>

                    <!-- Auction 3 -->
                    <tr class="hover:bg-secondary/50 transition">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10 rounded-md object-cover" src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1587&q=80" alt="">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium">Ming Dynasty Vase</div>
                                    <div class="text-xs text-light/50">Lot #MD-16C-87</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm countdown-timer" data-end="2025-06-17T12:00:00">3d 6h 42m</div>
                            <div class="w-full bg-light/20 rounded-full h-1 mt-1">
                                <div class="bg-accent h-full rounded-full" style="width: 25%"></div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                            $45,000
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            7
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-warning/10 text-warning">
                                        Reserve Not Met
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="flex justify-end space-x-2">
                                <button class="text-accent hover:text-accent/80 p-1">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="text-light/70 hover:text-danger p-1">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <!-- Recent Activity & Quick Actions -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Recent Bids -->
            <section class="lg:col-span-2">
                <h2 class="text-xl font-bold mb-4">
                    <i class="fas fa-history text-accent mr-2"></i> Recent Bids
                </h2>
                <div class="glass-panel rounded-xl overflow-hidden">
                    <table class="min-w-full divide-y divide-light/10">
                        <thead class="bg-secondary">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Item</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Bidder</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Amount</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Time</th>
                        </tr>
                        </thead>
                        <tbody class="divide-y divide-light/10">
                        <!-- Bid 1 -->
                        <tr class="hover:bg-secondary/50 transition">
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                Vintage Rolex Watch
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-8 w-8 rounded-full bg-accent/10 flex items-center justify-center">
                                        <i class="fas fa-user text-accent text-sm"></i>
                                    </div>
                                    <div class="ml-3">
                                        <div class="text-sm">john.doe@example.com</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                                $12,450
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                                12 minutes ago
                            </td>
                        </tr>
                        <!-- Bid 2 -->
                        <tr class="hover:bg-secondary/50 transition">
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                Abstract Oil Painting
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-8 w-8 rounded-full bg-accent/10 flex items-center justify-center">
                                        <i class="fas fa-user text-accent text-sm"></i>
                                    </div>
                                    <div class="ml-3">
                                        <div class="text-sm">sarah.smith@example.com</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                                $8,200
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                                34 minutes ago
                            </td>
                        </tr>
                        <!-- Bid 3 -->
                        <tr class="hover:bg-secondary/50 transition">
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                Ming Dynasty Vase
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="flex-shrink-0 h-8 w-8 rounded-full bg-accent/10 flex items-center justify-center">
                                        <i class="fas fa-user text-accent text-sm"></i>
                                    </div>
                                    <div class="ml-3">
                                        <div class="text-sm">michael.j@example.com</div>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-accent">
                                $45,000
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                                2 hours ago
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Quick Actions -->
            <section>
                <h2 class="text-xl font-bold mb-4">
                    <i class="fas fa-bolt text-accent mr-2"></i> Quick Actions
                </h2>
                <div class="glass-panel rounded-xl p-6 space-y-4">
                    <button class="w-full bg-accent hover:bg-accent/90 text-primary font-bold py-3 px-4 rounded-lg flex items-center justify-center">
                        <i class="fas fa-plus-circle mr-2"></i> Create New Auction
                    </button>
                    <button class="w-full bg-secondary hover:bg-secondary/80 border border-accent/30 text-accent font-bold py-3 px-4 rounded-lg flex items-center justify-center">
                        <i class="fas fa-user-plus mr-2"></i> Invite Bidders
                    </button>
                    <button class="w-full bg-secondary hover:bg-secondary/80 border border-accent/30 text-accent font-bold py-3 px-4 rounded-lg flex items-center justify-center">
                        <i class="fas fa-file-export mr-2"></i> Export Reports
                    </button>
                </div>

                <!-- Ending Soon -->
                <h2 class="text-xl font-bold mt-8 mb-4">
                    <i class="fas fa-clock text-accent mr-2"></i> Ending Soon
                </h2>
                <div class="glass-panel rounded-xl p-6 space-y-4">
                    <div class="flex items-center justify-between">
                        <div>
                            <h4 class="font-medium">Rolex Watch</h4>
                            <div class="text-xs text-light/70 countdown-timer" data-end="2025-06-15T14:30:00">2h 45m</div>
                        </div>
                        <button class="text-accent hover:text-accent/80">
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                    <div class="flex items-center justify-between">
                        <div>
                            <h4 class="font-medium">Abstract Painting</h4>
                            <div class="text-xs text-light/70 countdown-timer" data-end="2025-06-14T18:00:00">1d 4h</div>
                        </div>
                        <button class="text-accent hover:text-accent/80">
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </section>
        </div>
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
</script>
</body>
</html>
