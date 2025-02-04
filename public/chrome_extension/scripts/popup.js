// Get needed HTML elements
const form = document.getElementById('search-form');
const textArea = document.getElementById('user_input');
const results = document.getElementById('results');
const button = document.getElementById('send-data');

// Event listener for form submission
form.addEventListener('submit', (event) => {
  event.preventDefault();
  // console.log('Button clicked in popup.js');
  const userInput = textArea.value;
  console.log(userInput);

  // Insert the user input and a loader
  results.insertAdjacentHTML("beforeend", `<div class="box">
                              <p><strong>My input:</strong></p>
                              <p>${userInput}</p>
                              <div class="loader1"></div>
                            </div>`);

  fetch(form.action, {
    method: "POST",
    headers: { "Accept": "application/json" },
    body: new FormData(form)
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      results.innerHTML = data.partial;

      // Reset form after successful submission
      form.reset();

      button.classList.add("disabled");
      setTimeout(() => {
        button.classList.remove("disabled");
      }, 5000); // Enable button after 5 seconds
    })
})
