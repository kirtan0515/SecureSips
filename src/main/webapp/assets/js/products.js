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
                const colDiv = $('<div>').addClass('col-md-4');
                colDiv.append(productCard);
                productsContainer.append(colDiv);
            }

            // Update the event listener for the 'Add to cart' button after appending new product cards
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
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error(`Failed to load products: ${textStatus}, ${errorThrown}`);
        }
    });
});
