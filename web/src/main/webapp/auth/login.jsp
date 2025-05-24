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
    <title>Auction System - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="min-h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
        <h1 class="text-2xl font-bold text-center mb-6 text-blue-600">Auction System Login</h1>

        <%-- Error message display --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="mb-4 p-3 bg-red-100 text-red-700 rounded">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="username" name="username" required
                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" id="password" name="password" required
                       class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
            </div>

            <div>
                <button type="submit"
                        class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                    Login
                </button>
            </div>
        </form>

        <div class="mt-4 text-center text-sm text-gray-600">
            Don't have an account? <a href="#" class="text-blue-600 hover:text-blue-500">Contact admin</a>
        </div>
    </div>
</div>
</body>
</html>
