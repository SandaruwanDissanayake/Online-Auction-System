<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/24/2025
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Welcome Page for Auction Site
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premier Auctions | Bid on Exclusive Items</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #FFFFFF;
            color: #050206;
        }

        .hero-bg {
            background: linear-gradient(rgba(59, 59, 59, 0.7), rgba(59, 59, 59, 0.7)),
            url('https://images.unsplash.com/photo-1600585152220-90363fe7e115?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
        }

        .item-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .nav-link::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #9A8174;
            transition: width .3s;
        }

        .nav-link:hover::after {
            width: 100%;
        }
    </style>
</head>
<body class="flex flex-col min-h-screen">
<!-- Navigation Bar -->
<nav class="bg-[#3B3B3B] text-white shadow-lg">
    <div class="container mx-auto px-6 py-3 flex justify-between items-center">
        <div class="flex items-center space-x-4">
            <span class="font-bold text-2xl animate__animated animate__fadeIn">Premier Auctions</span>
        </div>
        <div class="flex items-center space-x-8 animate__animated animate__fadeIn animate__delay-1s">
            <a href="#featured" class="nav-link hover:text-[#9A8174] transition">Featured</a>
            <a href="#how-it-works" class="nav-link hover:text-[#9A8174] transition">How It Works</a>
            <a href="login.jsp" class="px-4 py-2 rounded hover:bg-[#9A8174] transition">Login</a>
            <a href="register.jsp" class="bg-[#9A8174] px-4 py-2 rounded hover:bg-[#7a6a5d] transition">Sign Up</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-bg text-white py-32 animate__animated animate__fadeIn">
    <div class="container mx-auto px-6 text-center">
        <h1 class="text-5xl font-bold mb-6 animate__animated animate__fadeInDown">Discover Rare & Exclusive Items</h1>
        <p class="text-xl mb-8 max-w-2xl mx-auto animate__animated animate__fadeIn animate__delay-1s">
            Join our premium auction platform to bid on unique collectibles, art, jewelry, and more from around the world.
        </p>
        <div class="animate__animated animate__fadeIn animate__delay-2s">
            <a href="register.jsp" class="bg-[#9A8174] hover:bg-[#7a6a5d] text-white font-bold py-3 px-8 rounded-full mr-4 transition">
                Get Started
            </a>
            <a href="#featured" class="border-2 border-white hover:bg-white hover:text-[#3B3B3B] text-white font-bold py-3 px-8 rounded-full transition">
                Browse Items
            </a>
        </div>
    </div>
</section>

<!-- Featured Auctions Section -->
<section id="featured" class="py-16 bg-white">
    <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12 text-[#3B3B3B]">Currently Featured Items</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Item 1 -->
            <div class="item-card bg-white rounded-lg overflow-hidden shadow-md transition duration-300">
                <div class="relative pb-[75%] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80"
                         alt="Vintage Watch"
                         class="absolute h-full w-full object-cover hover:scale-105 transition duration-500">
                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black to-transparent p-4">
                        <span class="text-white font-bold">Time Left: 2d 4h 32m</span>
                    </div>
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2 text-[#3B3B3B]">Vintage Rolex Watch</h3>
                    <p class="text-gray-600 mb-4">Circa 1965, excellent condition</p>
                    <div class="flex justify-between items-center">
                        <span class="text-lg font-bold text-[#9A8174]">$12,450</span>
                        <a href="login.jsp" class="text-[#3B3B3B] hover:text-[#9A8174] font-medium">Bid Now →</a>
                    </div>
                </div>
            </div>

            <!-- Item 2 -->
            <div class="item-card bg-white rounded-lg overflow-hidden shadow-md transition duration-300">
                <div class="relative pb-[75%] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1705&q=80"
                         alt="Abstract Painting"
                         class="absolute h-full w-full object-cover hover:scale-105 transition duration-500">
                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black to-transparent p-4">
                        <span class="text-white font-bold">Time Left: 1d 8h 15m</span>
                    </div>
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2 text-[#3B3B3B]">Abstract Oil Painting</h3>
                    <p class="text-gray-600 mb-4">By contemporary artist Maria V.</p>
                    <div class="flex justify-between items-center">
                        <span class="text-lg font-bold text-[#9A8174]">$8,200</span>
                        <a href="login.jsp" class="text-[#3B3B3B] hover:text-[#9A8174] font-medium">Bid Now →</a>
                    </div>
                </div>
            </div>

            <!-- Item 3 -->
            <div class="item-card bg-white rounded-lg overflow-hidden shadow-md transition duration-300">
                <div class="relative pb-[75%] overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1587&q=80"
                         alt="Antique Vase"
                         class="absolute h-full w-full object-cover hover:scale-105 transition duration-500">
                    <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black to-transparent p-4">
                        <span class="text-white font-bold">Time Left: 3d 6h 42m</span>
                    </div>
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2 text-[#3B3B3B]">Ming Dynasty Vase</h3>
                    <p class="text-gray-600 mb-4">16th century, verified authentic</p>
                    <div class="flex justify-between items-center">
                        <span class="text-lg font-bold text-[#9A8174]">$45,000</span>
                        <a href="login.jsp" class="text-[#3B3B3B] hover:text-[#9A8174] font-medium">Bid Now →</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section id="how-it-works" class="py-16 bg-[#f8f8f8]">
    <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center mb-12 text-[#3B3B3B]">How Our Auction Works</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="text-center p-6 bg-white rounded-lg shadow-sm">
                <div class="w-16 h-16 bg-[#9A8174] rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-white text-2xl font-bold">1</span>
                </div>
                <h3 class="text-xl font-bold mb-2 text-[#3B3B3B]">Register</h3>
                <p class="text-gray-600">Create your free account to participate in auctions.</p>
            </div>

            <div class="text-center p-6 bg-white rounded-lg shadow-sm">
                <div class="w-16 h-16 bg-[#9A8174] rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-white text-2xl font-bold">2</span>
                </div>
                <h3 class="text-xl font-bold mb-2 text-[#3B3B3B]">Bid</h3>
                <p class="text-gray-600">Place your bids on items you're interested in.</p>
            </div>

            <div class="text-center p-6 bg-white rounded-lg shadow-sm">
                <div class="w-16 h-16 bg-[#9A8174] rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-white text-2xl font-bold">3</span>
                </div>
                <h3 class="text-xl font-bold mb-2 text-[#3B3B3B]">Win</h3>
                <p class="text-gray-600">If you have the highest bid when time runs out, you win!</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-[#3B3B3B] text-white py-12 mt-auto">
    <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <h3 class="text-xl font-bold mb-4">Premier Auctions</h3>
                <p class="text-gray-400">The world's finest auction platform for rare and exclusive items.</p>
            </div>
            <div>
                <h4 class="font-bold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-[#9A8174] transition">About Us</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-[#9A8174] transition">Privacy Policy</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-[#9A8174] transition">Terms of Service</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-bold mb-4">Contact</h4>
                <ul class="space-y-2">
                    <li class="text-gray-400">123 Auction Ave, City</li>
                    <li class="text-gray-400">contact@premierreauctions.com</li>
                    <li class="text-gray-400">+1 (555) 123-4567</li>
                </ul>
            </div>
            <div>
                <h4 class="font-bold mb-4">Follow Us</h4>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-[#9A8174] transition">FB</a>
                    <a href="#" class="text-gray-400 hover:text-[#9A8174] transition">TW</a>
                    <a href="#" class="text-gray-400 hover:text-[#9A8174] transition">IG</a>
                    <a href="#" class="text-gray-400 hover:text-[#9A8174] transition">LI</a>
                </div>
            </div>
        </div>
        <div class="border-t border-gray-700 mt-8 pt-8 text-center text-gray-400">
            <p>© 2023 Premier Auctions. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Animation Script -->
<script>
    // Simple animation trigger on scroll
    document.addEventListener('DOMContentLoaded', function() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('#featured .item-card, #how-it-works > div > div').forEach(el => {
            observer.observe(el);
        });
    });

</script>
</body>
</html>
