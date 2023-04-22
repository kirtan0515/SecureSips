$(document).ready(function() {
    // Initialize the cart
    let cart = {};

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

        // Create table header
        const tableHeader = $('<tr>').append(
            $('<th>').text('Item'),
            $('<th>').text('Quantity'),
            $('<th>').text('Total')
        );
        $('.product-list').append(tableHeader);

        for (let productId in cart) {
            let product = cart[productId];
            let productTotal = product.price * product.quantity;
            total += productTotal;

            // Create a table row for each product
            let tableRow = $('<tr>').append(
                $('<td>').text(product.name),
                $('<td>').text(`${product.quantity} x $${product.price.toFixed(2)}`),
                $('<td>').text(`$${productTotal.toFixed(2)}`)
            );
            $('.product-list').append(tableRow);
        }

        // Create a table row for the subtotal
        let subtotalRow = $('<tr>').append(
            $('<td>').attr('colspan', '2').text('Subtotal'),
            $('<td>').text(`$${total.toFixed(2)}`)
        );
        $('.product-list').append(subtotalRow);

        // Update the total price
        $('.total-price').text(`$${total.toFixed(2)}`);
    }

    $('.hamburger').on('click', function () {
        $('.order-review-panel').toggle();
    });

    function filterProductCards(searchText) {
        $('.product-card').each(function () {
            const productName = $(this).find('h4 a').text().toLowerCase();
            if (productName.includes(searchText.toLowerCase())) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

    $('#search-bar').on('input', function () {
        const searchText = $(this).val();
        filterProductCards(searchText);
    });

    $('#search-btn').on('click', function () {
        const searchText = $('#search-bar').val();
        filterProductCards(searchText);
    });

    // Make an AJAX request to retrieve the products from the server
    $.ajax({
        url: '/products',
        method: 'GET',
        dataType: 'json',
        success: function (products) {
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
                const colDiv = $('<div>').addClass('col-md-4');
                colDiv.append(productCard);
                productsContainer.append(colDiv);
            }
            ;

            function addToCartHandler() {
                let productId = $(this).data('product-id');
                let quantity = 1;
                let price = parseFloat($(this).closest('.product-bottom-details').find('.product-price').text().substring(1));
                let name = $(this).closest('.product-details').find('h4 a').text();

                console.log('Sending: productId=' + productId + ', quantity=' + quantity + ', price=' + price + ', name=' + name); // Added this line

                // Send an AJAX request to the server to add the product to the cart
                $.ajax({
                    url: '/update-cart', // Replace with your servlet URL
                    method: 'POST',
                    data: {
                        productId: productId,
                        quantity: quantity,
                        price: price,
                        name: name
                    },
                    success: function (response) {
                        console.log('Received response:', response);
                        if (response.success) {
                            // Update the cart object in the local JavaScript scope
                            if (!cart[productId]) {
                                cart[productId] = {
                                    name: name,
                                    price: price,
                                    quantity: 0
                                };
                            }
                            cart[productId].quantity += quantity;

                            // Update the cart quantity and order review panel
                            updateCartQuantity();
                            updateOrderReviewPanel();
                        } else {
                            // Show an error message
                            console.error('Failed to add the product to the cart on the server');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error(`Failed to add the product to the cart: ${textStatus}, ${errorThrown}`);
                    }
                });
            }

            // Update the event listener for the 'Add to cart' button after appending new product cards
            $(document).on('click', '.add-to-cart', addToCartHandler);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error(`Failed to load products: ${textStatus}, ${errorThrown}`);
        }
    });
});
