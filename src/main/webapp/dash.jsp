<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="header.jsp" %>
    <link rel="stylesheet" href="./assets/css/SHARED.css">
    <link rel="stylesheet" href="./assets/css/dash.css">
    <link rel="stylesheet" href="./assets/css/shop.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Secure Sips - Our Products</title>
</head>
<body>
<div>
<div class="navigation-bar">
    <div id="navigation-container">
        <a href="dash"><img src="./assets/images/aa.png"></a>
        <ul>
            <li><a href="checkout">Shopping Cart</a></li>
            <li><a href="#">My Account</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
        <div class="hamburger">
            <i class="fa fa-bars"></i>
            <span class="cart-quantity">0</span>
        </div>
        <!-- Add this div to display the order review panel -->
        <div class="order-review-panel">
            <h3>Added Products</h3>
            <ul class="product-list"></ul>
            <h3>Total: <span class="total-price">$0.00</span></h3>
        </div>
        <!-- Add the search bar and button inside the navigation-container div -->
        <div class="search-container">
            <input type="text" id="search-bar" placeholder="Search products...">
            <button id="search-btn"><i class="fa fa-search"></i></button>
        </div>
    </div>
</div>
    <h1>Our Products</h1>
    <div class="product-grid">
        <div class="product-card">
            <div class="badge">New</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee1.jpeg" alt="Colombian Supremo">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Colombian Supremo</a></h4>
                <p class="product-description">A rich and full-bodied coffee with a smooth finish. Grown in the mountains of Colombia, this coffee is sure to please even the most discerning coffee drinkers.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$12.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Sale</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee2.png" alt="Guatemala Antigua">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Guatemala Antigua</a></h4>
                <p class="product-description">This medium roast coffee is grown in the Antigua region of Guatemala and has a complex flavor profile with notes of chocolate, caramel, and citrus.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$14.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Hot</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee3.png" alt="Ethiopian Yirgacheffe">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Ethiopian Yirgacheffe</a></h4>
                <p class="product-description">This light roast coffee has a bright and floral flavor with hints of fruit and a clean finish. Grown in the Yirgacheffe region of Ethiopia, this coffee is perfect for those who prefer a lighter roast.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$10.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Hot</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee3.png" alt="Ethiopian Yirgacheffe">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Ethiopian Yirgacheffe</a></h4>
                <p class="product-description">This light roast coffee has a bright and floral flavor with hints of fruit and a clean finish. Grown in the Yirgacheffe region of Ethiopia, this coffee is perfect for those who prefer a lighter roast.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$10.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Hot</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee3.png" alt="Ethiopian Yirgacheffe">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Ethiopian Yirgacheffe</a></h4>
                <p class="product-description">This light roast coffee has a bright and floral flavor with hints of fruit and a clean finish. Grown in the Yirgacheffe region of Ethiopia, this coffee is perfect for those who prefer a lighter roast.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$10.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Hot</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee3.png" alt="Ethiopian Yirgacheffe">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Ethiopian Yirgacheffe</a></h4>
                <p class="product-description">This light roast coffee has a bright and floral flavor with hints of fruit and a clean finish. Grown in the Yirgacheffe region of Ethiopia, this coffee is perfect for those who prefer a lighter roast.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$10.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Hot</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee3.png" alt="Ethiopian Yirgacheffe">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Ethiopian Yirgacheffe</a></h4>
                <p class="product-description">This light roast coffee has a bright and floral flavor with hints of fruit and a clean finish. Grown in the Yirgacheffe region of Ethiopia, this coffee is perfect for those who prefer a lighter roast.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$10.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-card">
            <div class="badge">Hot</div>
            <div class="product-tumb">
                <img src="./assets/images/coffee3.png" alt="Ethiopian Yirgacheffe">
            </div>
            <div class="product-details">
                <span class="product-catagory">Coffee</span>
                <h4><a href="">Ethiopian Yirgacheffe</a></h4>
                <p class="product-description">This light roast coffee has a bright and floral flavor with hints of fruit and a clean finish. Grown in the Yirgacheffe region of Ethiopia, this coffee is perfect for those who prefer a lighter roast.</p>
                <div class="product-bottom-details">
                    <div class="product-price">$10.99</div>
                    <div class="product-links">
                        <button class="cart-btn"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        // Initialize the cart
        let cart = {};

        // Handle the 'Add to cart' button click
        $('.add-to-cart').on('click', function() {
            let productId = $(this).data('product-id');
            let quantity = 1;
            let price = parseFloat($(this).closest('.product-bottom-details').find('.product-price').text().substring(1));
            let name = $(this).closest('.product-details').find('h4 a').text();

            if (!cart[productId]) {
                cart[productId] = {
                    name: name,
                    price: price,
                    quantity: 0
                };
            }

            cart[productId].quantity += quantity;

            updateCartQuantity();
            updateOrderReviewPanel();
        });

        function updateCartQuantity() {
            let totalQuantity = 0;
            for (let productId in cart) {
                totalQuantity += cart[productId].quantity;
            }

            $('.cart-quantity').text(totalQuantity);
        }

        function updateOrderReviewPanel() {
            let total = 0;
            $('.product-list').empty();
            for (let productId in cart) {
                let product = cart[productId];
                let productTotal = product.price * product.quantity;
                total += productTotal;

                let listItem = $('<li>').text(`${product.name} - ${product.quantity} x $${product.price.toFixed(2)} = $${productTotal.toFixed(2)}`);
                $('.product-list').append(listItem);
            }

            $('.total-price').text(`$${total.toFixed(2)}`);
        }

        $('.hamburger').on('click', function() {
            $('.order-review-panel').toggle();
        });

        // Add this function to filter the product cards
        function filterProductCards(searchText) {
            $('.product-card').each(function() {
                const productName = $(this).find('h4 a').text().toLowerCase();
                if (productName.includes(searchText.toLowerCase())) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }

        // Add these event listeners inside the $(document).ready() function
        $('#search-bar').on('input', function() {
            const searchText = $(this).val();
            filterProductCards(searchText);
        });

        $('#search-btn').on('click', function() {
            const searchText = $('#search-bar').val();
            filterProductCards(searchText);
        });

        // Make an AJAX request to retrieve the products from the server
        $.ajax({
            url: '/products',
            method: 'GET',
            dataType: 'json',
            success: function(products) {
                // Render the products on the page
                const productsContainer = $('.products-container');
                productsContainer.empty();

                for (let i = 0; i < products.length; i++) {
                    const product = products[i];
                    const productCard = $('<div>').addClass('product-card');
                    const productDetails = $('<div>').addClass('product-details');
                    const productImg = $('<img>').attr('src', product.image);
                    const productName = $('<h4>').html(`<a href="/products/${product.id}">${product.name}</a>`);
                    const productDescription = $('<p>').text(product.description);
                    const productBottomDetails = $('<div>').addClass('product-bottom-details');
                    const productPrice = $('<div>').addClass('product-price').text(`$${product.price.toFixed(2)}`);
                    const addToCartButton = $('<button>').addClass('add-to-cart').data('product-id', product.id).text('Add to Cart');

                    productDetails.append(productImg, productName, productDescription);
                    productBottomDetails.append(productPrice, addToCartButton);
                    productCard.append(productDetails, productBottomDetails);
                    productsContainer.append(productCard);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error(`Failed to load products: ${textStatus}, ${errorThrown}`);
            }
        });
    });
</script>

