<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/24/2025
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bidder Dashboard | Luxe Auctions</title>
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
                    }
                }
            }
        }
    </script>

    <script>
        const ws = new WebSocket("ws://localhost:8080/updateCurrentBid");

        ws.onopen = () => {
            console.log("WebSocket connection established.");
        };

        ws.onmessage = (event) => {
            const data = JSON.parse(event.data);
            console.log("Current Bid Amount: " + data.currentBid);
            console.log("Auction ID: " + data.auctionId);

            // Find all auction cards (both bids and auctions)
            const auctionCards = document.querySelectorAll('.bid-card');

            auctionCards.forEach(card => {
                const cardAuctionId = card.getAttribute('data-auction-id');

                if (cardAuctionId && cardAuctionId == data.auctionId) {
                    // ===== 1. UPDATE CURRENT BID (in available auctions) =====
                    // Targets: <span class="font-bold">$XXX.00</span> in auctions section
                    const currentBidElement = card.querySelector('.currentBidamount');
                    if (currentBidElement) {
                        currentBidElement.textContent = `$`+data.currentBid+`.00`;

                        // Visual feedback
                        currentBidElement.classList.add('animate-pulse', 'text-green-500');
                        setTimeout(() => {
                            currentBidElement.classList.remove('animate-pulse', 'text-green-500');
                        }, 1000);
                    }

                    // ===== 2. UPDATE HIGHEST BID (in your bids) =====
                    // Targets: <span class="font-bold">$XXX.00</span> in bids section (not the red "Your bid")
                    // const highestBidElement = card.querySelector('.flex.justify-between span.text-light/60 + span.font-bold:not(.text-red-400)');

                     const highestBidElement = card.querySelector('.maxBidAmount');
                    if (highestBidElement) {
                        highestBidElement.textContent = `$`+data.currentBid+`.00`;

                        // Visual feedback
                        highestBidElement.classList.add('animate-pulse', 'text-green-500');
                        setTimeout(() => {
                            highestBidElement.classList.remove('animate-pulse', 'text-green-500');
                        }, 1000);

                        const yourBidAmount=card.querySelector('.yourBidAmount');
                        yourBidAmount.classList.add('animate-pulse', 'text-red-400');
                        setTimeout(() => {
                            yourBidAmount.classList.remove('animate-pulse', 'text-green-400');
                        })
                        const bidCardStatuselement=card.querySelector('.bidCardStatus');
                        bidCardStatuselement.textContent="OUTBID";

                        bidCardStatuselement.classList.add('animate-pulse', 'bg-red-400/20 text-red-400');
                        setTimeout(() => {
                            bidCardStatuselement.classList.remove('animate-pulse', 'bg-red-400/20 text-red-400');
                        })
                    }
                }
            });
        };

        ws.onclose = () => {
            console.log("WebSocket closed.");
            // Optional: Add reconnection logic here
        };

        ws.onerror = (err) => {
            console.error("WebSocket error", err);
            // Optional: Add error handling/reconnection here
        };
    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #111111 0%, #2F2F2F 100%);
        }
        .bid-card {
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 203, 116, 0.1);
        }
        .bid-card:hover {
            transform: translateY(-5px);
            border-color: rgba(255, 203, 116, 0.3);
            box-shadow: 0 10px 25px -5px rgba(255, 203, 116, 0.1);
        }
        .progress-bar {
            height: 4px;
            background: #FFCB74;
        }
        .status-badge {
            background: rgba(255, 203, 116, 0.15);
            border: 1px solid rgba(255, 203, 116, 0.3);
        }

        /* Bid update animation */
        .bid-updated {
            animation: bidPulse 0.5s ease;
            color: #FFCB74;
        }

        @keyframes bidPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        /* Connection status indicator */
        #connection-status {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 8px;
        }

        #connection-status.connected {
            background-color: #4CAF50;
        }

        #connection-status.disconnected {
            background-color: #F44336;
        }

        /* Bid notification */
        .bid-notification {
            position: fixed;
            bottom: 20px;
            right: -300px;
            background: #FFCB74;
            color: #111111;
            padding: 12px 20px;
            border-radius: 4px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            z-index: 1000;
            transition: right 0.3s ease-out;
        }

        .bid-notification.show {
            right: 20px;
        }

        .bid-notification-content {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .bid-notification i {
            font-size: 1.2em;
        }
    </style>
</head>
<body class="bg-primary text-light">
<!-- Header -->
<header class="gradient-bg shadow-xl sticky top-0 z-50">
    <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <div class="flex items-center space-x-2">
            <i class="fas fa-gavel text-accent text-2xl"></i>
            <h1 class="text-2xl font-bold">LUXE AUCTIONS</h1>
        </div>
        <div class="flex items-center space-x-6">
            <div class="relative group">
                <button class="flex items-center space-x-1">
                    <span class="text-accent"><i class="fas fa-bell"></i></span>
                    <span class="absolute -top-1 -right-1 bg-red-500 text-xs rounded-full h-5 w-5 flex items-center justify-center">3</span>
                </button>
            </div>
            <div class="flex items-center space-x-2">
                <span class="text-accent"><i class="fas fa-user-circle text-xl"></i></span>
                <span class="font-medium">${sessionScope.email}</span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="text-light hover:text-accent transition-colors">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </div>
</header>

<!-- Main Dashboard -->
<div class="container mx-auto px-6 py-8">
    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <!-- Active Bids -->
        <div class="bg-secondary rounded-xl shadow-md p-6 border border-accent/10">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70 text-sm">Active Bids</p>
                    <p class="text-3xl font-bold mt-1">14</p>
                </div>
                <div class="text-accent bg-accent/10 p-3 rounded-lg">
                    <i class="fas fa-gavel text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10">
                <p class="text-xs text-light/50"><i class="fas fa-arrow-up text-accent mr-1"></i> 2 new today</p>
            </div>
        </div>

        <!-- Winning -->
        <div class="bg-secondary rounded-xl shadow-md p-6 border border-accent/10">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70 text-sm">Winning</p>
                    <p class="text-3xl font-bold mt-1">7</p>
                </div>
                <div class="text-green-400 bg-green-400/10 p-3 rounded-lg">
                    <i class="fas fa-trophy text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10">
                <p class="text-xs text-light/50"><i class="fas fa-arrow-up text-green-400 mr-1"></i> 1 new</p>
            </div>
        </div>

        <!-- Outbid -->
        <div class="bg-secondary rounded-xl shadow-md p-6 border border-accent/10">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70 text-sm">Outbid</p>
                    <p class="text-3xl font-bold mt-1">3</p>
                </div>
                <div class="text-red-400 bg-red-400/10 p-3 rounded-lg">
                    <i class="fas fa-exclamation-triangle text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10">
                <p class="text-xs text-light/50"><i class="fas fa-arrow-down text-red-400 mr-1"></i> 2 today</p>
            </div>
        </div>

        <!-- Watchlist -->
        <div class="bg-secondary rounded-xl shadow-md p-6 border border-accent/10">
            <div class="flex justify-between items-start">
                <div>
                    <p class="text-light/70 text-sm">Watchlist</p>
                    <p class="text-3xl font-bold mt-1">9</p>
                </div>
                <div class="text-blue-400 bg-blue-400/10 p-3 rounded-lg">
                    <i class="fas fa-heart text-xl"></i>
                </div>
            </div>
            <div class="mt-4 pt-4 border-t border-light/10">
                <p class="text-xs text-light/50"><i class="fas fa-eye text-blue-400 mr-1"></i> 3 ending soon</p>
            </div>
        </div>
    </div>
    <%--    My bids Section--%>
    <section class="mb-12">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold">
                <i class="fas fa-gavel text-accent mr-2"></i>My Bids
            </h2>
            <a href="browse" class="text-accent hover:underline flex items-center">
                Browse All <i class="fas fa-chevron-right ml-1 text-sm"></i>
            </a>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <c:forEach items="${bids}" var="bids">
<%--                <div class="bid-card bg-secondary rounded-xl overflow-hidden relative " data-auction-id="${bids.getAuction().getId()} >--%>
                <div class="bid-card bg-secondary rounded-xl overflow-hidden relative" data-auction-id="${bids.getAuction().getId()}">
                    <div class="relative pb-[70%]">
                        <img src="${bids.getAuction().getImagePath()}"
                             class="absolute h-full w-full object-cover">
                        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 to-transparent p-4">
                            <div class="flex justify-between items-center text-sm mb-2">
                                <span class="font-medium text-light">Ends in ${bids.getAuction().getEndTime()}</span>
                                <span class="px-2 py-1 rounded-full text-xs bidCardStatus
  <c:choose>
    <c:when test="${bids.status eq 'OUTBID'}">bg-orange-400/20 text-orange-400</c:when>
    <c:when test="${bids.status eq 'WINNING'}">bg-green-400/20 text-green-400</c:when>
    <c:when test="${bids.status eq 'LOST'}">bg-red-400/20 text-red-400</c:when>
    <c:when test="${bids.status eq 'PENDING'}">bg-blue-400/20 text-blue-400</c:when>
    <c:otherwise>bg-gray-400/20 text-gray-400</c:otherwise>
  </c:choose>
">
                                        ${bids.status}
                                </span> </div>
                            <div class="w-full bg-light/20 rounded-full h-1.5">
                                <div class="progress-bar rounded-full" style="width: 45%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold mb-2">${bids.getAuction().getTitle()}</h3>
                        <p class="text-light/70 text-sm mb-4">${bids.getAuction().getDescription()}</p>

                        <div class="space-y-3 mb-5" >
                            <div class="flex justify-between">
                                <span class="text-light/60">Your bid</span>
                                <span  class="font-bold yourBidAmount
    <c:choose>
        <c:when test="${bids.getAmount() eq bids.getMaxBid()}">text-green-400</c:when>
        <c:otherwise>text-red-400</c:otherwise>
    </c:choose>
">$${bids.getAmount()}</span>
                            </div>
                            <div class="flex justify-between ">
                                <span class="text-light/60">Highest bid</span>
                                <span class="font-bold maxBidAmount">$${bids.getMaxBid()}</span>
                            </div>
                        </div>

                        <button class="w-full bg-accent hover:bg-accent/90 text-primary py-2.5 px-4 rounded-lg border border-accent transition-colors font-medium">
                            <i class="fas fa-gavel mr-2"></i>Place New Bid
                        </button>
                    </div>
                </div>
            </c:forEach>


        </div>
    </section>


    <!-- Active Bids Section -->
    <section class="mb-12">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold">
                <i class="fas fa-bolt text-accent mr-2"></i>Live Auctions
            </h2>
            <a href="browse" class="text-accent hover:underline flex items-center">
                Browse All <i class="fas fa-chevron-right ml-1 text-sm"></i>
            </a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <c:forEach items="${auctions}" var="auctions">
                <div class="bid-card bg-secondary rounded-xl overflow-hidden relative" data-auction-id="${auctions.getId()}">
                    <div class="relative pb-[70%]">
                         <img src="${auctions.getImagePath()}" alt="${auctions.getTitle()}"
                                class="absolute h-full w-full object-cover">
                        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 to-transparent p-4">
                            <div class="flex justify-between items-center text-sm mb-2">
                                <span class="font-medium text-light">Ends in : ${auctions.getEndTime()}</span>
                                <span class="px-2 py-1 rounded-full text-xs
  <c:choose>
    <c:when test="${auctions.status eq 'PENDING'}">bg-orange-400/20 text-orange-400</c:when>
    <c:when test="${auctions.status eq 'ACTIVE'}">bg-green-400/20 text-green-400</c:when>
    <c:when test="${auctions.status eq 'CLOSED'}">bg-red-400/20 text-red-400</c:when>
    <c:otherwise>bg-gray-400/20 text-gray-400</c:otherwise>
  </c:choose>
">
                                        ${auctions.status}
                                </span>
                            </div>
                            <div class="w-full bg-light/20 rounded-full h-1.5">
                                <div class="progress-bar rounded-full" style="width: 92%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-xl font-bold mb-2">${auctions.getTitle()}</h3>
                        <p class="text-light/70 text-sm mb-4">${auctions.getDescription()}</p>

                        <div class="space-y-3 mb-5">
                            <div class="flex justify-between">
                                <span class="text-light/60">Current bid</span>
                                <span class="font-bold currentBidamount">$${auctions.getCurrentBid()}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-light/60">Reserve</span>
                                <span class="font-bold text-green-400">Met</span>
                            </div>
                        </div>
                            <button class="w-full bg-accent/10 hover:bg-accent/20 text-accent py-2.5 px-4 rounded-lg border border-accent/20 transition-colors font-medium text-center">
                                <a href="${pageContext.request.contextPath}/loadBidScreen?id=${auctions.getId()}"
                                   class="block w-full h-full">
                                    <i class="fas fa-gavel mr-2"></i>Place Bid
                                </a>
                            </button>
                    </div>
                </div>

            </c:forEach>

            <!-- Winning Bid Card -->
<%--            <div class="bid-card bg-secondary rounded-xl overflow-hidden relative">--%>
<%--                <div class="relative pb-[70%]">--%>
<%--                    <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1999&q=80"--%>
<%--                         class="absolute h-full w-full object-cover">--%>
<%--                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 to-transparent p-4">--%>
<%--                        <div class="flex justify-between items-center text-sm mb-2">--%>
<%--                            <span class="font-medium text-light">Ends in 1h 22m</span>--%>
<%--                            <span class="bg-green-400/20 text-green-400 px-2 py-1 rounded-full text-xs">WINNING</span>--%>
<%--                        </div>--%>
<%--                        <div class="w-full bg-light/20 rounded-full h-1.5">--%>
<%--                            <div class="progress-bar rounded-full" style="width: 92%"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="p-6">--%>
<%--                    <h3 class="text-xl font-bold mb-2">Rolex Daytona</h3>--%>
<%--                    <p class="text-light/70 text-sm mb-4">2023 Model • Unworn</p>--%>

<%--                    <div class="space-y-3 mb-5">--%>
<%--                        <div class="flex justify-between">--%>
<%--                            <span class="text-light/60">Your bid</span>--%>
<%--                            <span class="font-bold text-accent">$18,750</span>--%>
<%--                        </div>--%>
<%--                        <div class="flex justify-between">--%>
<%--                            <span class="text-light/60">Highest bid</span>--%>
<%--                            <span class="font-bold">$18,750</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <button class="w-full bg-accent/10 hover:bg-accent/20 text-accent py-2.5 px-4 rounded-lg border border-accent/20 transition-colors font-medium">--%>
<%--                        <i class="fas fa-plus-circle mr-2"></i>Increase Bid--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Outbid Card -->--%>
<%--            <div class="bid-card bg-secondary rounded-xl overflow-hidden relative">--%>
<%--                <div class="relative pb-[70%]">--%>
<%--                    <img src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80"--%>
<%--                         class="absolute h-full w-full object-cover">--%>
<%--                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 to-transparent p-4">--%>
<%--                        <div class="flex justify-between items-center text-sm mb-2">--%>
<%--                            <span class="font-medium text-light">Ends in 3d 4h</span>--%>
<%--                            <span class="bg-red-400/20 text-red-400 px-2 py-1 rounded-full text-xs">OUTBID</span>--%>
<%--                        </div>--%>
<%--                        <div class="w-full bg-light/20 rounded-full h-1.5">--%>
<%--                            <div class="progress-bar rounded-full" style="width: 45%"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="p-6">--%>
<%--                    <h3 class="text-xl font-bold mb-2">Hermès Birkin 25</h3>--%>
<%--                    <p class="text-light/70 text-sm mb-4">Togo Leather • Gold Hardware</p>--%>

<%--                    <div class="space-y-3 mb-5">--%>
<%--                        <div class="flex justify-between">--%>
<%--                            <span class="text-light/60">Your bid</span>--%>
<%--                            <span class="font-bold text-red-400">$12,000</span>--%>
<%--                        </div>--%>
<%--                        <div class="flex justify-between">--%>
<%--                            <span class="text-light/60">Highest bid</span>--%>
<%--                            <span class="font-bold">$14,250</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <button class="w-full bg-accent hover:bg-accent/90 text-primary py-2.5 px-4 rounded-lg border border-accent transition-colors font-medium">--%>
<%--                        <i class="fas fa-gavel mr-2"></i>Place New Bid--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Watching Card -->--%>
<%--            <div class="bid-card bg-secondary rounded-xl overflow-hidden relative">--%>
<%--                <div class="relative pb-[70%]">--%>
<%--                    <img src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80"--%>
<%--                         class="absolute h-full w-full object-cover">--%>
<%--                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black/90 to-transparent p-4">--%>
<%--                        <div class="flex justify-between items-center text-sm mb-2">--%>
<%--                            <span class="font-medium text-light">Ends in 2d 8h</span>--%>
<%--                            <span class="bg-blue-400/20 text-blue-400 px-2 py-1 rounded-full text-xs">WATCHING</span>--%>
<%--                        </div>--%>
<%--                        <div class="w-full bg-light/20 rounded-full h-1.5">--%>
<%--                            <div class="progress-bar rounded-full" style="width: 35%"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <button class="absolute top-3 right-3 text-red-400 hover:text-red-300">--%>
<%--                        <i class="fas fa-heart text-xl"></i>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="p-6">--%>
<%--                    <h3 class="text-xl font-bold mb-2">Patek Philippe</h3>--%>
<%--                    <p class="text-light/70 text-sm mb-4">Vintage 1965 • Mint Condition</p>--%>

<%--                    <div class="space-y-3 mb-5">--%>
<%--                        <div class="flex justify-between">--%>
<%--                            <span class="text-light/60">Current bid</span>--%>
<%--                            <span class="font-bold">$32,500</span>--%>
<%--                        </div>--%>
<%--                        <div class="flex justify-between">--%>
<%--                            <span class="text-light/60">Reserve</span>--%>
<%--                            <span class="font-bold text-green-400">Met</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <button class="w-full bg-accent/10 hover:bg-accent/20 text-accent py-2.5 px-4 rounded-lg border border-accent/20 transition-colors font-medium">--%>
<%--                        <i class="fas fa-hand-paper mr-2"></i>Place Bid--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>


    </section>

    <!-- Recent Activity -->
    <section>
        <h2 class="text-2xl font-bold mb-6">
            <i class="fas fa-history text-accent mr-2"></i>Recent Activity
        </h2>

        <div class="bg-secondary rounded-xl shadow-md overflow-hidden">
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-light/10">
                    <thead class="bg-secondary">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Item</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Activity</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Time</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-light/50 uppercase tracking-wider">Status</th>
                        <th scope="col" class="relative px-6 py-3"><span class="sr-only">Action</span></th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-light/10">
                    <!-- Activity 1 -->
                    <tr class="hover:bg-secondary/70 transition-colors">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10 rounded-full object-cover" src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1999&q=80" alt="">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium">Rolex Daytona</div>
                                    <div class="text-xs text-light/50">Lot #RD-2023-42</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm">Bid increased</div>
                            <div class="text-xs text-accent">+$500</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                            22 minutes ago
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-400/10 text-green-400">
                                        Leading
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <a href="#" class="text-accent hover:text-accent/80">View →</a>
                        </td>
                    </tr>

                    <!-- Activity 2 -->
                    <tr class="hover:bg-secondary/70 transition-colors">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10 rounded-full object-cover" src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80" alt="">
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium">Hermès Birkin</div>
                                    <div class="text-xs text-light/50">Lot #HB-25-GH</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm">Outbid notification</div>
                            <div class="text-xs text-red-400">-$2,250</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-light/70">
                            3 hours ago
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-400/10 text-red-400">
                                        Outbid
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <a href="#" class="text-accent hover:text-accent/80">Rebid →</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</div>

<!-- Footer -->
<footer class="bg-secondary border-t border-light/10 mt-12 py-8">
    <div class="container mx-auto px-6">
        <div class="flex flex-col md:flex-row justify-between items-center">
            <div class="flex items-center space-x-2 mb-4 md:mb-0">
                <i class="fas fa-gavel text-accent"></i>
                <span class="font-bold">LUXE AUCTIONS</span>
            </div>
            <div class="flex space-x-6">
                <a href="#" class="text-light/70 hover:text-accent transition-colors">Terms</a>
                <a href="#" class="text-light/70 hover:text-accent transition-colors">Privacy</a>
                <a href="#" class="text-light/70 hover:text-accent transition-colors">Support</a>
            </div>
        </div>
        <div class="mt-6 pt-6 border-t border-light/10 text-center text-sm text-light/50">
            © 2023 Luxe Auctions. All rights reserved.
        </div>
    </div>
</footer>

<!-- Live updates script -->
<script>
    // Simulate real-time updates
    function updateBidStatus() {
        // In a real app, this would fetch from your backend
        console.log("Checking for bid updates...");

        // Example: Randomly update one of the bid cards
        const bidCards = document.querySelectorAll('.bid-card');
        if(bidCards.length > 0) {
            const randomCard = bidCards[Math.floor(Math.random() * bidCards.length)];
            const priceElement = randomCard.querySelector('.font-bold:not(.text-accent):not(.text-red-400)');
            if(priceElement) {
                const currentPrice = parseFloat(priceElement.textContent.replace(/\$|,/g, ''));
                priceElement.textContent = '$' + (currentPrice + 50).toLocaleString();
            }
        }
    }

    // Update every 30 seconds
    //setInterval(updateBidStatus, 30000);

    // Initialize tooltips
    document.querySelectorAll('[data-tooltip]').forEach(el => {
        el.addEventListener('mouseenter', () => {
            const tooltip = document.createElement('div');
            tooltip.className = 'absolute z-50 bg-primary text-light text-xs px-2 py-1 rounded shadow-lg';
            tooltip.textContent = el.getAttribute('data-tooltip');
            document.body.appendChild(tooltip);

            const rect = el.getBoundingClientRect();
            tooltip.style.top = `${rect.top - 30}px`;
            tooltip.style.left = `${rect.left + rect.width/2 - tooltip.offsetWidth/2}px`;

            el.addEventListener('mouseleave', () => {
                tooltip.remove();
            }, { once: true });
        });
    });






</script>


</body>
</html>