<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/24/2025
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxe Auctions | Login</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #111111 0%, #2F2F2F 100%);
        }
        .login-card {
            background: rgba(246, 246, 246, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 203, 116, 0.1);
        }
        .social-btn {
            transition: all 0.3s ease;
        }
        .social-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(255, 203, 116, 0.2);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
<div class="login-card rounded-2xl shadow-xl w-full max-w-md overflow-hidden">
    <!-- Header Section -->
    <div class="bg-primary py-6 px-8 text-center border-b border-accent/20">
        <div class="flex justify-center items-center space-x-2 mb-2">
            <i class="fas fa-gavel text-accent text-2xl"></i>
            <h1 class="text-2xl font-bold text-light">LUXE AUCTIONS</h1>
        </div>
        <p class="text-light/70">Access your premium auction account</p>
    </div>

    <!-- Main Form -->
    <div class="p-8">
        <%-- Error message display --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="mb-4 p-3 bg-red-400/10 text-red-400 rounded-lg border border-red-400/30">
            <i class="fas fa-exclamation-circle mr-2"></i>
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-5">
            <div>
                <label for="username" class="block text-sm font-medium text-light/80 mb-1">Email Address</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-envelope text-light/40"></i>
                    </div>
                    <input type="email" id="username" name="username" required
                           class="bg-secondary/50 border border-light/10 text-light placeholder-light/40 rounded-lg focus:ring-accent focus:border-accent block w-full pl-10 p-2.5"
                           placeholder="your@email.com">
                </div>
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-light/80 mb-1">Password</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-lock text-light/40"></i>
                    </div>
                    <input type="password" id="password" name="password" required
                           class="bg-secondary/50 border border-light/10 text-light placeholder-light/40 rounded-lg focus:ring-accent focus:border-accent block w-full pl-10 p-2.5"
                           placeholder="••••••••">
                </div>
            </div>

            <div class="flex items-center justify-between">
                <div class="flex items-center">
                    <input id="remember-me" name="remember-me" type="checkbox"
                           class="h-4 w-4 text-accent focus:ring-accent border-light/30 rounded bg-secondary">
                    <label for="remember-me" class="ml-2 block text-sm text-light/70">Remember me</label>
                </div>
                <div class="text-sm">
                    <a href="#" class="font-medium text-accent hover:text-accent/80">Forgot password?</a>
                </div>
            </div>

            <button type="submit"
                    class="w-full bg-accent hover:bg-accent/90 text-primary font-bold py-3 px-4 rounded-lg transition duration-200">
                Sign In
            </button>
        </form>

        <!-- Social Login Divider -->
        <div class="relative my-6">
            <div class="absolute inset-0 flex items-center">
                <div class="w-full border-t border-light/20"></div>
            </div>
            <div class="relative flex justify-center text-sm">
                <span class="px-2 bg-secondary text-light/50">Or continue with</span>
            </div>
        </div>

        <!-- Social Login Buttons -->
        <div class="grid grid-cols-2 gap-4">
            <a href="#"
               class="social-btn bg-[#4285F4] hover:bg-[#4285F4]/90 text-white font-medium py-2.5 px-4 rounded-lg flex items-center justify-center">
                <i class="fab fa-google mr-2"></i> Google
            </a>
            <a href="#"
               class="social-btn bg-[#3b5998] hover:bg-[#3b5998]/90 text-white font-medium py-2.5 px-4 rounded-lg flex items-center justify-center">
                <i class="fab fa-facebook-f mr-2"></i> Facebook
            </a>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="bg-primary/80 py-4 px-8 text-center border-t border-accent/20">
        <p class="text-sm text-light/60">
            Don't have an account?
            <a href="#" class="font-medium text-accent hover:text-accent/80">Request access</a>
        </p>
    </div>
</div>

<!-- Background decorative elements -->
<div class="fixed -bottom-32 -left-32 w-64 h-64 bg-accent/10 rounded-full filter blur-3xl"></div>
<div class="fixed -top-32 -right-32 w-64 h-64 bg-accent/5 rounded-full filter blur-3xl"></div>
</body>
</html>
