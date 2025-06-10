<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/25/2025
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Luxe Auctions | Bid on Exclusive Items</title>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;600&display=swap');

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #F6F6F6;
      color: #111111;
    }

    .hero-bg {
      background: linear-gradient(rgba(17, 17, 17, 0.85), rgba(47, 47, 47, 0.85)),
      url('https://images.unsplash.com/photo-1600585152220-90363fe7e115?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
      background-size: cover;
      background-position: center;
    }

    .item-card {
      transition: all 0.3s ease;
      border: 1px solid rgba(255, 203, 116, 0.1);
    }

    .item-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 25px -5px rgba(255, 203, 116, 0.1);
      border-color: rgba(255, 203, 116, 0.3);
    }

    .nav-link::after {
      content: '';
      display: block;
      width: 0;
      height: 2px;
      background: #FFCB74;
      transition: width .3s;
    }

    .nav-link:hover::after {
      width: 100%;
    }

    .countdown-timer {
      font-feature-settings: "tnum";
      font-variant-numeric: tabular-nums;
    }
  </style>
</head>
<body class="flex flex-col min-h-screen">
<!-- Navigation Bar -->
<nav class="bg-primary text-light shadow-lg">
  <div class="container mx-auto px-6 py-3 flex justify-between items-center">
    <div class="flex items-center space-x-3">
      <i class="fas fa-gavel text-accent"></i>
      <span class="font-bold text-2xl animate__animated animate__fadeIn">Luxe Auctions</span>
    </div>
    <div class="flex items-center space-x-8 animate__animated animate__fadeIn animate__delay-1s">
      <a href="#featured" class="nav-link hover:text-accent transition">Featured</a>
      <a href="#how-it-works" class="nav-link hover:text-accent transition">How It Works</a>
      <a href="login.jsp" class="px-4 py-2 rounded hover:bg-accent/10 transition">Login</a>
      <a href="register.jsp" class="bg-accent hover:bg-accent/90 text-primary px-4 py-2 rounded transition">Sign Up</a>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero-bg text-light py-32 animate__animated animate__fadeIn">
  <div class="container mx-auto px-6 text-center">
    <h1 class="text-5xl font-bold mb-6 animate__animated animate__fadeInDown">Discover Rare & Exclusive Items</h1>
    <p class="text-xl mb-8 max-w-2xl mx-auto animate__animated animate__fadeIn animate__delay-1s">
      Join our premium auction platform to bid on unique collectibles, art, jewelry, and more from around the world.
    </p>
    <div class="animate__animated animate__fadeIn animate__delay-2s">
      <a href="register.jsp" class="bg-accent hover:bg-accent/90 text-primary font-bold py-3 px-8 rounded-full mr-4 transition">
        Get Started
      </a>
      <a href="#featured" class="border-2 border-light hover:bg-light hover:text-primary text-light font-bold py-3 px-8 rounded-full transition">
        Browse Items
      </a>
    </div>
  </div>
</section>

<!-- Featured Auctions Section -->
<section id="featured" class="py-16 bg-light">
  <div class="container mx-auto px-6">
    <h2 class="text-3xl font-bold text-center mb-12 text-primary">Currently Featured Items</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <!-- Item 1 -->
      <div class="item-card bg-light rounded-xl overflow-hidden shadow-md">
        <div class="relative pb-[75%] overflow-hidden">
          <img src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80"
               alt="Vintage Watch"
               class="absolute h-full w-full object-cover hover:scale-105 transition duration-500">
          <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black to-transparent p-4">
            <div class="flex justify-between items-center text-sm">
              <span class="text-white font-bold">Time Left: 1d 8h 42m</span>
            </div>
            <div class="w-full bg-light/20 rounded-full h-1.5 mt-2">
              <div class="bg-accent h-full rounded-full" style="width: 65%"></div>
            </div>
          </div>
          <div class="absolute top-3 right-3 bg-accent/20 backdrop-blur-sm text-light px-2 py-1 rounded-full text-xs font-bold border border-accent/30">
            <i class="fas fa-bolt mr-1"></i> HOT BID
          </div>
        </div>
        <div class="p-6">
          <h3 class="text-xl font-bold mb-2 text-primary">Vintage Rolex Watch</h3>
          <p class="text-secondary mb-4">Circa 1965, excellent condition</p>
          <div class="flex justify-between items-center">
            <span class="text-lg font-bold text-accent">$12,450</span>
            <a href="login.jsp" class="text-primary hover:text-accent font-medium flex items-center">
              Bid Now <i class="fas fa-arrow-right ml-1 text-sm"></i>
            </a>
          </div>
        </div>
      </div>

      <!-- Item 2 -->
      <div class="item-card bg-light rounded-xl overflow-hidden shadow-md">
        <div class="relative pb-[75%] overflow-hidden">
          <img src="https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1705&q=80"
               alt="Abstract Painting"
               class="absolute h-full w-full object-cover hover:scale-105 transition duration-500">
          <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black to-transparent p-4">
            <div class="flex justify-between items-center text-sm">
              <span class="text-white font-bold">Time Left: 5d 1h 42m</span>
            </div>
            <div class="w-full bg-light/20 rounded-full h-1.5 mt-2">
              <div class="bg-accent h-full rounded-full" style="width: 45%"></div>
            </div>
          </div>
        </div>
        <div class="p-6">
          <h3 class="text-xl font-bold mb-2 text-primary">Abstract Oil Painting</h3>
          <p class="text-secondary mb-4">By contemporary artist Maria V.</p>
          <div class="flex justify-between items-center">
            <span class="text-lg font-bold text-accent">$8,200</span>
            <a href="login.jsp" class="text-primary hover:text-accent font-medium flex items-center">
              Bid Now <i class="fas fa-arrow-right ml-1 text-sm"></i>
            </a>
          </div>
        </div>
      </div>

      <!-- Item 3 -->
      <div class="item-card bg-light rounded-xl overflow-hidden shadow-md">
        <div class="relative pb-[75%] overflow-hidden">
          <img src="https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1587&q=80"
               alt="Antique Vase"
               class="absolute h-full w-full object-cover hover:scale-105 transition duration-500">
          <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-black to-transparent p-4">
            <div class="flex justify-between items-center text-sm">
              <span class="text-white font-bold">Time Left: 3d 6h 42m</span>
            </div>
            <div class="w-full bg-light/20 rounded-full h-1.5 mt-2">
              <div class="bg-accent h-full rounded-full" style="width: 25%"></div>
            </div>
          </div>
          <div class="absolute top-3 right-3 bg-green-500/20 backdrop-blur-sm text-light px-2 py-1 rounded-full text-xs font-bold border border-green-500/30">
            <i class="fas fa-certificate mr-1"></i> VERIFIED
          </div>
        </div>
        <div class="p-6">
          <h3 class="text-xl font-bold mb-2 text-primary">Ming Dynasty Vase</h3>
          <p class="text-secondary mb-4">16th century, verified authentic</p>
          <div class="flex justify-between items-center">
            <span class="text-lg font-bold text-accent">$45,000</span>
            <a href="login.jsp" class="text-primary hover:text-accent font-medium flex items-center">
              Bid Now <i class="fas fa-arrow-right ml-1 text-sm"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- How It Works Section -->
<section id="how-it-works" class="py-16 bg-secondary/5">
  <div class="container mx-auto px-6">
    <h2 class="text-3xl font-bold text-center mb-12 text-primary">How Our Auction Works</h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div class="text-center p-6 bg-light rounded-xl shadow-sm hover:shadow-md transition">
        <div class="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
          <span class="text-primary text-2xl font-bold">1</span>
        </div>
        <h3 class="text-xl font-bold mb-2 text-primary">Register</h3>
        <p class="text-secondary">Create your free account to participate in auctions.</p>
      </div>

      <div class="text-center p-6 bg-light rounded-xl shadow-sm hover:shadow-md transition">
        <div class="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
          <span class="text-primary text-2xl font-bold">2</span>
        </div>
        <h3 class="text-xl font-bold mb-2 text-primary">Bid</h3>
        <p class="text-secondary">Place your bids on items you're interested in.</p>
      </div>

      <div class="text-center p-6 bg-light rounded-xl shadow-sm hover:shadow-md transition">
        <div class="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
          <span class="text-primary text-2xl font-bold">3</span>
        </div>
        <h3 class="text-xl font-bold mb-2 text-primary">Win</h3>
        <p class="text-secondary">If you have the highest bid when time runs out, you win!</p>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="bg-primary text-light py-12 mt-auto">
  <div class="container mx-auto px-6">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
      <div>
        <h3 class="text-xl font-bold mb-4 flex items-center">
          <i class="fas fa-gavel text-accent mr-2"></i> Luxe Auctions
        </h3>
        <p class="text-light/70">The world's finest auction platform for rare and exclusive items.</p>
      </div>
      <div>
        <h4 class="font-bold mb-4">Quick Links</h4>
        <ul class="space-y-2">
          <li><a href="#" class="text-light/70 hover:text-accent transition">About Us</a></li>
          <li><a href="#" class="text-light/70 hover:text-accent transition">Privacy Policy</a></li>
          <li><a href="#" class="text-light/70 hover:text-accent transition">Terms of Service</a></li>
        </ul>
      </div>
      <div>
        <h4 class="font-bold mb-4">Contact</h4>
        <ul class="space-y-2">
          <li class="text-light/70"><i class="fas fa-map-marker-alt text-accent mr-2"></i> 123 Auction Ave, City</li>
          <li class="text-light/70"><i class="fas fa-envelope text-accent mr-2"></i> contact@luxeauctions.com</li>
          <li class="text-light/70"><i class="fas fa-phone text-accent mr-2"></i> +1 (555) 123-4567</li>
        </ul>
      </div>
      <div>
        <h4 class="font-bold mb-4">Follow Us</h4>
        <div class="flex space-x-4">
          <a href="#" class="text-light/70 hover:text-accent transition text-xl"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="text-light/70 hover:text-accent transition text-xl"><i class="fab fa-twitter"></i></a>
          <a href="#" class="text-light/70 hover:text-accent transition text-xl"><i class="fab fa-instagram"></i></a>
          <a href="#" class="text-light/70 hover:text-accent transition text-xl"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>
    </div>
    <div class="border-t border-light/10 mt-8 pt-8 text-center text-light/50">
      <p>© 2023 Luxe Auctions. All rights reserved.</p>
    </div>
  </div>
</footer>

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
        timer.innerHTML = "Auction ended";
        return;
      }

      // Calculate time remaining
      const days = Math.floor(distance / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

      // Display the result
      timer.innerHTML = `${days}d ${hours}h ${minutes}m`;

      // Update progress bar width
      const totalHours = Math.floor(distance / (1000 * 60 * 60));
      const progressBar = timer.closest('.item-card').querySelector('.progress-bar-inner');
      if (progressBar) {
        // Simple progression calculation (you can customize this)
        const progressPercent = 100 - (totalHours / 72 * 100); // Assuming 72hr auctions
        progressBar.style.width = `${Math.min(100, Math.max(0, progressPercent))}%`;
      }
    });
  }

  // Initialize and update every second
  document.addEventListener('DOMContentLoaded', function() {
    updateCountdowns(); // Run immediately
    setInterval(updateCountdowns, 60000); // Update every minute

    // Animation observer (keep your existing animation code)
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
