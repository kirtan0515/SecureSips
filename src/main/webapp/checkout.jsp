<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Add this line before your script tag -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="./assets/css/checkout.css"> <!-- Replace with your own stylesheet -->
</head>
<body>
<h1>Checkout</h1>
<div class="back-to-dash">
    <a href="dash">
        <img class="logo-small" src="./assets/images/bb.png" alt="Logo"> <!-- Replace with your own logo image file -->
    </a>
</div>
<div class="container">
    <div class="shipping-info">
        <h2>Shipping Information</h2>
        <form>
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>
            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>
            <label for="zip">Zip Code:</label>
            <input type="text" id="zip" name="zip" required>
            <label for="country">Country:</label>
            <input type="text" id="country" name="country" required>
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>
            <form onsubmit="return false;"></form>
        </form>
    </div>

    <div class="payment">
        <h2>Payment</h2>
        <form onsubmit="submitForm(event);">
            <label for="card_name">Name on Card:</label>
            <input type="text" id="card_name" name="card_name" required>
            <label for="card_number">Card Number:</label>
            <input type="text" id="card_number" name="card_number" required>
            <label for="expiry">Expiry Date:</label>
            <input type="month" id="expiry" name="expiry" required>
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" required>
            <button type="submit" class="submit-payment">Submit Payment</button>
        </form>
    </div>
    <div class="cart-summary">
        <h2>Order Summary</h2>
        <table class="cart-items">
            <thead>
            <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>
            <!-- Cart items will be added here dynamically using JavaScript -->
            </tbody>
        </table>
        <div class="cart-total">
            <span>Total:</span>
            <span class="total-price"></span>
        </div>
    </div>
</div>
<div id="alert-modal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p id="alert-message"></p>
    </div>
</div>

<script src="./alert.js"></script>
<script>
    function submitForm(event) {
        event.preventDefault();
        document.getElementById("alert-message").innerHTML = 'Thank you!<br>Your order is confirmed and it will ship between 3 to 5 business days.<br>Order Number: ' + generateOrderNumber();
        showModal();
    }

    function generateOrderNumber() {
        return Math.floor(Math.random() * 1000000);
    }

    function showModal() {
        var modal = document.getElementById("alert-modal");
        var span = document.getElementsByClassName("close")[0];

        modal.style.display = "block";

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }

    document.querySelector(".submit-payment").addEventListener("click", submitForm);
    function loadCartFromLocalStorage() {
        const cartData = localStorage.getItem('cart');
        return cartData ? JSON.parse(cartData) : {};
    }

    function displayCartItems() {
        let cart = loadCartFromLocalStorage();

        // Check if the cart is empty
        if (Object.keys(cart).length === 0) {
            // Make an AJAX request to retrieve the cart items from the server
            $.ajax({
                url: '/update-cart',
                method: 'GET',
                dataType: 'json',
                success: function (cartData) {
                    cart = cartData;
                    displayCartItemsFromServer(cart);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error(`Failed to load cart items: ${textStatus}, ${errorThrown}`);
                }
            });
        } else {
            displayCartItemsFromServer(cart);
        }
    }

    function displayCartItemsFromServer(cart) {
        const cartItemsTableBody = document.querySelector('.cart-items tbody');
        const totalPriceElement = document.querySelector('.total-price');
        let total = 0;

        for (const productId in cart) {
            const product = cart[productId];
            const productTotal = product.price * product.quantity;
            total += productTotal;

            const tableRow = document.createElement('tr');
            tableRow.innerHTML = `
            <td>${product.name}</td>
            <td>${product.quantity}</td>
            <td>$${productTotal.toFixed(2)}</td>
        `;
            cartItemsTableBody.appendChild(tableRow);
        }

        totalPriceElement.textContent = `$${total.toFixed(2)}`;
    }
    window.onload = function() {
        displayCartItems();
    };
</script>
</body>
</html>

