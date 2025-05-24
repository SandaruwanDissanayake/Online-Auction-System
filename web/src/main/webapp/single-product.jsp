<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.name} - Product Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
</head>
<body class="bg-gray-50">
<div class="container mx-auto px-4 py-8 max-w-4xl">
    <!-- Back button -->
    <a href="${pageContext.request.contextPath}/home"
       class="inline-flex items-center mb-4 text-blue-600 hover:text-blue-800">
        <i class="fas fa-arrow-left mr-2"></i> Back to Products
    </a>

    <!-- Product Card -->
    <div class="bg-white rounded-xl shadow-md overflow-hidden">
        <div class="md:flex">
            <!-- Product Image -->
            <div class="md:w-1/3 bg-gray-100 flex items-center justify-center p-8">
                <i class="fas fa-box-open text-8xl text-gray-400"></i>
            </div>

            <!-- Product Details -->
            <div class="p-8 md:w-2/3">
                <div class="flex justify-between items-start">
                    <div>
                        <h1 class="text-2xl font-bold text-gray-800">${product.name}</h1>
                        <div class="flex items-center mt-2">
                            <span class="text-xl font-bold text-blue-600">$${product.price}</span>
                            <span class="ml-3 px-2.5 py-0.5 rounded-full text-xs font-medium
                                      ${product.quantity > 0 ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                                ${product.quantity > 0 ? 'In Stock' : 'Out of Stock'}
                            </span>
                        </div>
                    </div>
                    <span class="bg-blue-100 text-blue-800 text-xs font-medium px-2.5 py-0.5 rounded">
                            ID: ${product.id}
                        </span>
                </div>

                <!-- Description -->
                <div class="mt-6">
                    <h3 class="text-sm font-medium text-gray-900">Description</h3>
                    <div class="mt-2 text-gray-600">
                        <p>${product.description}</p>
                    </div>
                </div>

                <!-- Additional Details -->
                <div class="mt-6 grid grid-cols-2 gap-4">
                    <div>
                        <h3 class="text-sm font-medium text-gray-900">Quantity Available</h3>
                        <p class="mt-1 text-gray-600">${product.quantity} units</p>
                    </div>
<%--                    <div>--%>
<%--                        <h3 class="text-sm font-medium text-gray-900">Category</h3>--%>
<%--                        <p class="mt-1 text-gray-600">${not empty product.category ? product.category : 'N/A'}</p>--%>
<%--                    </div>--%>
                </div>

                <!-- Action Buttons -->
                <div class="mt-8 flex space-x-3">
                    <button type="button"
                            class="flex-1 bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md font-medium
                                       ${product.quantity == 0 ? 'opacity-50 cursor-not-allowed' : ''}"
                    ${product.quantity == 0 ? 'disabled' : ''}>
                        Add to Cart
                    </button>
                    <button type="button"
                            class="flex-1 border border-gray-300 text-gray-700 py-2 px-4 rounded-md font-medium hover:bg-gray-50">
                        Wishlist
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Related Products (optional) -->
    <div class="mt-12">
        <h2 class="text-xl font-bold text-gray-800 mb-4">You May Also Like</h2>
        <!-- You could add a related products section here -->
        <div class="text-center py-8 text-gray-500 border border-dashed rounded-lg">
            <i class="fas fa-boxes text-4xl mb-2"></i>
            <p>Related products would appear here</p>
        </div>
    </div>
</div>
</body>
</html>