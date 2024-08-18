function calculate() {
    let num1 = document.getElementById('num1').value;
    let num2 = document.getElementById('num2').value;

    // Check if both numbers are entered
    if (num1 === '' || num2 === '') {
        document.getElementById('result').innerText = 'Please enter both numbers.';
        return;
    }

    // API endpoint with query parameters
    let apiUrl = `/sum?a=${num1}&b=${num2}`;

    // Fetch API call
    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Network response was not ok: ${response.statusText}`);
            }
            return response.text();  // Assuming the API returns a plain text string
        })
        .then(data => {
            document.getElementById('result').innerText = 'Result: ' + data;
        })
        .catch(error => {
            document.getElementById('result').innerText = 'Error: ' + error.message;
        });
}