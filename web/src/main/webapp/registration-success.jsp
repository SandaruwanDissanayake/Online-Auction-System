<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/22/2025
  Time: 6:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8 max-w-2xl">
    <div class="bg-white rounded-xl shadow-md p-8 text-center">
        <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-green-100">
            <i class="fas fa-check text-green-600"></i>
        </div>
        <h2 class="mt-3 text-xl font-medium text-gray-900">Product Registered Successfully!</h2>
        <p class="mt-2 text-gray-600">Your product has been added to the system.</p>
        <div class="mt-6">
            <a href="${pageContext.request.contextPath}/register-product"
               class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                <i class="fas fa-plus mr-2"></i> Add Another Product
            </a>
            <a href="${pageContext.request.contextPath}/home"
               class="ml-3 inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                <i class="fas fa-list mr-2"></i> View Product List
            </a>
        </div>
    </div>
</div>
</body>
</html>
