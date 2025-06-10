<%--
  Created by IntelliJ IDEA.
  User: sanda
  Date: 5/22/2025
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product Registration</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-gray-100">
<div class="container mx-auto px-4 py-8 max-w-2xl">
  <div class="bg-white rounded-xl shadow-md p-8">
    <h1 class="text-2xl font-bold text-gray-800 mb-6">Register New Product</h1>

    <c:if test="${not empty errorMessage}">
      <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
          ${errorMessage}
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register-product"
          method="post"
          enctype="multipart/form-data"
          class="space-y-6">

      <!-- Product Name -->
      <div>
        <label for="name" class="block text-sm font-medium text-gray-700">Product Name</label>
        <input type="text" id="name" name="name" required
               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 p-2 border">
      </div>

      <!-- Price -->
      <div>
        <label for="price" class="block text-sm font-medium text-gray-700">Price ($)</label>
        <input type="number" id="price" name="price" step="0.01" min="0" required
               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 p-2 border">
      </div>

      <!-- Description -->
      <div>
        <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
        <textarea id="description" name="description" rows="3" required
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 p-2 border"></textarea>
      </div>

      <!-- Quantity -->
      <div>
        <label for="quantity" class="block text-sm font-medium text-gray-700">Quantity</label>
        <input type="number" id="quantity" name="quantity" min="0" required
               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 p-2 border">
      </div>

      <!-- Category -->
      <div>
        <label for="category" class="block text-sm font-medium text-gray-700">Category</label>
        <select id="category" name="category"
                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 p-2 border">
          <option value="Electronics">Electronics</option>
          <option value="Clothing">Clothing</option>
          <option value="Books">Books</option>
          <option value="Home">Home & Garden</option>
          <option value="Other">Other</option>
        </select>
      </div>

      <!-- Image Upload -->
      <div>
        <label for="image" class="block text-sm font-medium text-gray-700">Product Image</label>
        <input type="file" id="image" name="image" accept="image/*"
               class="mt-1 block w-full text-sm text-gray-500
                                  file:mr-4 file:py-2 file:px-4
                                  file:rounded-md file:border-0
                                  file:text-sm file:font-semibold
                                  file:bg-blue-50 file:text-blue-700
                                  hover:file:bg-blue-100">
        <p class="mt-1 text-sm text-gray-500">PNG, JPG, JPEG up to 5MB</p>
      </div>

      <!-- Submit Button -->
      <div class="flex justify-end">
        <button type="submit"
                class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
          <i class="fas fa-save mr-2"></i> Register Product
        </button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
