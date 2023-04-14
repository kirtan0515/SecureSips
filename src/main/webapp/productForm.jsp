<!DOCTYPE html>
<html>
<head>
    <title>Product Form</title>
    <link rel="stylesheet" href="./assets/css/productForm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
</head>
<body>
<div class="header">
    <button class="return-to-dash" onclick="location.href='dash.jsp'"><i class="fas fa-home"></i> Return To Dash</button>
    <h1>Product Form</h1>
</div>
<form action="/add-product" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Product Image:</td>
            <td><input type="file" name="product-image" id="product-image" accept="image/*"></td>
        </tr>
        <tr>
            <td>Product Category:</td>
            <td>
                <select name="product-category" id="product-category">
                    <option value="category1">Category 1</option>
                    <option value="category2">Category 2</option>
                    <option value="category3">Category 3</option>
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
            <td></td>
            <td><button type="submit">Submit</button></td>
        </tr>
    </table>
</form>
<script src="./assets/js/productForm.js"></script>
</body>
</html>


