<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/30/2025
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Bid | Luxe Auctions</title>
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
        body {
            background-color: #111111;
            color: #F6F6F6;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #111111 0%, #2F2F2F 100%);
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="gradient-bg shadow-xl sticky top-0 z-50">
    <div class="container mx-auto px-6 py-4">
        <div class="flex items-center space-x-2">
            <i class="fas fa-gavel text-accent text-2xl"></i>
            <h1 class="text-2xl font-bold">LUXE AUCTIONS</h1>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="container mx-auto px-6 py-8 max-w-4xl">
    <div class="bg-secondary rounded-xl shadow-lg p-8">
        <h2 class="text-2xl font-bold mb-6 border-b border-accent/20 pb-4">
            <i class="fas fa-gavel text-accent mr-2"></i>Place Your Bid
        </h2>

        <!-- Auction Summary -->
        <div class="flex flex-col md:flex-row gap-8 mb-8">
            <div class="w-full md:w-1/3">
                <div class="relative pb-[100%] rounded-lg overflow-hidden">
                    <img src="${auction.getImagePath()}"
                         class="absolute h-full w-full object-cover"
                         alt="${auction.getTitle()}">
                </div>
            </div>

            <div class="w-full md:w-2/3">
                <h3 class="text-xl font-bold mb-2">${auction.getTitle()}</h3>
                <p class="text-light/70 mb-4">${auction.getDescription()}</p>

                <div class="grid grid-cols-2 gap-4 mb-6">
                    <div>
                        <p class="text-light/60">Current Bid</p>
                        <p class="text-2xl font-bold">
                            <fmt:formatNumber value="${auction.getCurrentBid()}" type="currency" currencySymbol="$"/>
                        </p>
                    </div>
                    <div>
                        <p class="text-light/60">Minimum Increment</p>
                        <p class="text-xl text-accent">
                            +<fmt:formatNumber value="1" type="currency" currencySymbol="$"/>
                        </p>
                    </div>
                    <div>
                        <p class="text-light/60">Time Remaining</p>
                        <p class="text-lg">12.10</p>
                    </div>
                    <div>
                        <p class="text-light/60">Auction Status</p>
                        <span class="px-2 py-1 rounded-full text-xs
                                  ${auction.getStatus() == 'ACTIVE' ? 'bg-success/20 text-success' :
                                    auction.getStatus() == 'OUTBID' ?  'bg-danger/20 text-danger' :
                                    auction.getStatus() == 'CLOSED' ? 'bg-danger/20 text-danger' : 'bg-warning/20 text-warning'}">
                            ${auction.getStatus()}
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bid Form -->
        <form id="bidForm" action="${pageContext.request.contextPath}/PlaceBidServlet" method="post">
            <input type="hidden" name="auctionId" value="${auction.getId()}">

            <div class="space-y-6">
                <div>
                    <label for="bidAmount" class="block text-sm font-medium text-light/80 mb-2">
                        Your Bid Amount
                    </label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-light/70">$</span>
                        <input type="number" id="bidAmount" name="bidAmount"
                               min="${auction.currentBid + auction.getBidIncrement()}"
                               step="${auction.getBidIncrement()}"
                               value="${auction.currentBid + auction.getBidIncrement()}"
                               class="w-full pl-8 pr-4 py-3 rounded-lg bg-primary border border-accent/30
                                          focus:outline-none focus:ring-2 focus:ring-accent text-light"
                               required>
                    </div>
                    <p class="text-xs text-light/50 mt-1">
                        Minimum bid: $<fmt:formatNumber value="${auction.getCurrentBid() + auction.getBidIncrement()}" type="currency" currencySymbol=""/>
                    </p>
                </div>

                <div class="flex items-center">
                    <input type="checkbox" id="proxyBid" name="proxyBid"
                           class="mr-2 rounded border-accent/30 text-accent focus:ring-accent">
                    <label for="proxyBid" class="text-sm text-light/80">
                        Automatically bid up to my maximum amount
                    </label>
                </div>

                <div id="maxBidContainer" class="hidden">
                    <label for="maxBid" class="block text-sm font-medium text-light/80 mb-2">
                        Maximum Bid Amount
                    </label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-light/70">$</span>
                        <input type="number" id="maxBid" name="maxBid"
                               class="w-full pl-8 pr-4 py-3 rounded-lg bg-primary border border-accent/30
                                          focus:outline-none focus:ring-2 focus:ring-accent text-light">
                    </div>
                </div>

                <div class="flex space-x-4 pt-4 border-t border-accent/10">
                    <a href="${pageContext.request.contextPath}/auction-detail?id=${auction.getId()}"
                       class="flex-1 text-center border border-accent/30 text-light hover:bg-primary/50 rounded-lg py-3 px-4 transition-colors">
                        Back to Auction
                    </a>
                    <button type="submit"
                            class="flex-1 bg-accent hover:bg-accent/90 text-primary font-bold rounded-lg py-3 px-4 transition-colors">
                        <i class="fas fa-gavel mr-2"></i> Submit Bid
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>

<!-- Footer -->
<footer class="bg-secondary border-t border-light/10 mt-12 py-8">
    <div class="container mx-auto px-6 text-center text-sm text-light/50">
        © 2023 Luxe Auctions. All rights reserved.
    </div>
</footer>

<script>
    // Toggle max bid field
    document.getElementById('proxyBid').addEventListener('change', function() {
        const maxBidContainer = document.getElementById('maxBidContainer');
        const bidAmount = document.getElementById('bidAmount');

        if (this.checked) {
            maxBidContainer.classList.remove('hidden');
            bidAmount.step = "any";
            document.getElementById('maxBid').min = bidAmount.value;
            document.getElementById('maxBid').value = bidAmount.value;
        } else {
            maxBidContainer.classList.add('hidden');
            bidAmount.step = "${auction.bidIncrement}";
        }
    });

    // Form validation
    document.getElementById('bidForm').addEventListener('submit', function(e) {
        const bidAmount = parseFloat(document.getElementById('bidAmount').value);
        const minBid = parseFloat("${auction.currentBid + auction.bidIncrement}");

        if (bidAmount < minBid) {
            e.preventDefault();
            alert(`Your bid must be at least $${minBid.toLocaleString()}`);
            return;
        }

        if (document.getElementById('proxyBid').checked) {
            const maxBid = parseFloat(document.getElementById('maxBid').value);
            if (maxBid < bidAmount) {
                e.preventDefault();
                alert('Maximum bid must be equal to or greater than your initial bid');
                return;
            }
        }

        // Show loading state
        const submitBtn = this.querySelector('button[type="submit"]');
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i> Processing...';
        submitBtn.disabled = true;
    });
</script>
</body>
</html>