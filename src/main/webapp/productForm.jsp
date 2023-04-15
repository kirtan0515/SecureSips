<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Form</title>
    <link rel="stylesheet" href="./assets/css/productForm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
</head>

<%-- Alert Code (has to be on every page)--%>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<input type="hidden" id="message" value="<%= request.getAttribute("message")%>">

<body>
<div class="header">
    <button class="return-to-dash" onclick="location.href='dash.jsp'"><i class="fas fa-home"></i> Return To Dash
    </button>
    <h1>Product Form</h1>
</div>
<form action="ManageProducts" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Product Image:</td>
            <td><input type="file" name="product-image" id="product-image" accept="image/*"></td>
        </tr>
        <tr>
            <td>Product Category:</td>
            <td>
                <select name="product-category" id="product-category">
                    <option value="Coffee">Coffee</option>
                    <option value="Merchandise">Merchandise</option>
                    <option value="Books">Books</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Product Name:</td>
            <td><input type="text" name="product-name" id="product-name"></td>
        </tr>
        <tr>
            <td>Product Description:</td>
            <td><textarea name="product-description" id="product-description"></textarea></td>
        </tr>
        <tr>
            <td>Product Price:</td>
            <td><input type="number" name="product-price" id="product-price" step="0.01"></td>
        </tr>
        <tr>
            <td>Product Quantity:</td>
            <td><input type="number" name="product-quantity" id="product-quantity" step="1"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Submit</button>
            </td>
        </tr>
    </table>
</form>
<div class="container">
    <table>
        <thead>
        <tr>
            <th>Product ID</th>
            <th>Product Image</th>
            <th>Product Category</th>
            <th>Product Name</th>
            <th>Product Description</th>
            <th>Product Price</th>
            <th>Product Quantity</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td><img src="${Base64.getEncoder().encodeToString(product.imageUrl)}" alt="Product Image"></td>
                <td>${product.category}</td>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>
                    <a href="productForm.jsp?id=${product.id}">
                        <button>Edit</button>
                    </a>
                    <button onclick="deleteProduct(${product.id})">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--<script src="./assets/js/productForm.js"></script>--%>
<script>
    // Delete a product
    function deleteProduct(productId) {
        if (confirm("Are you sure you want to delete this product?")) {
            // Send a DELETE request to the backend servlet with the product ID
            const xhr = new XMLHttpRequest();
            xhr.open("DELETE", `ProductServlet?id=${productId}`);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // Reload the page to update the product list
                    window.location.reload();
                } else {
                    alert("Failed to delete the product.");
                }
            }
            xhr.send();
        }
    }
</script>
</body>
<%-- For Good Looking Alerts--%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="./alert.js"></script>


</html>


