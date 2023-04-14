const form = document.getElementById('product-form');
form.addEventListener('submit', (event) => {
    event.preventDefault();

    const productName = document.getElementById('product-name').value;
    const productDescription = document.getElementById('product-description').value;
    const productPrice = document.getElementById('product-price').value;

    if (!isValidString(productName) || !isValidString(productDescription) || !isValidPrice(productPrice)) {
        alert('Please fill out all required fields with valid information.');
        return;
    }

    const formData = new FormData(form);
    fetch('/add-product', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);
            alert('Product added successfully!');
            form.reset();
        })
        .catch(error => {
            console.error(error);
            alert('Error adding product!');
        });
});

function isValidString(input) {
    return input && input.trim().length > 0;
}

function isValidPrice(price) {
    return price >= 0;
}
