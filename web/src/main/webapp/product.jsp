<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="container mx-auto p-4">
    <h1 class="text-2xl font-bold mb-4">Products</h1>

    <c:choose>
        <c:when test="${empty products}">
            <p class="text-gray-500">No products found.</p>
        </c:when>
        <c:otherwise>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <c:forEach items="${products}" var="product">
                    <div class="border p-4 rounded shadow hover:shadow-lg transition-shadow">
                        <h3 class="font-bold text-lg">${product.name}</h3>
                        <p class="text-blue-600 font-semibold">$${product.price}</p>
                        <p class="text-gray-600 mt-2">${product.description}</p>
                        <a href="${pageContext.request.contextPath}/single-product?id=${product.id}"
                           class="inline-flex items-center mt-3 px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800 hover:bg-blue-200 transition-colors">
                            View Details
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>