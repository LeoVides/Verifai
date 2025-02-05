import { resetForm } from './resetForm.js';
import { removeElements } from './removeElements.js';
import { updateCounter } from './updateCounter.js';
import { loadSVGs } from './loadSVGs.js';
import { updateProgressBar } from './updateProgressBar.js';


// Get needed HTML elements
const form = document.getElementById('search-form');
const textArea = document.getElementById('user_input');
const results = document.getElementById('results');
const button = document.getElementById('send-data');
const counter = document.getElementById("char-count");
const checkIcon = document.getElementById("char-count-icn");



// GET RESULTS FUNCTION
function getResults(userInput) {
  // Insert the user input and a loader
  results.insertAdjacentHTML("beforeend",
                            `<div class="d-flex justify-content-end">
                              <div class="user-input p-3">
                                <div class="d-flex align-items-center">
                                  <img width="24px" src="/assets/user.svg">
                                  <h3>Input</h3>
                                </div>
                                <p>${userInput}</p>
                              </div>
                            </div>
                            <div class="box my-4">
                              <div class="loader1"></div>
                            </div>`
  );

  // Fetch results from server
  fetch(form.action, {
    method: "POST",
    mode: "no-cors",
    headers: { "Accept": "application/json" },
    body: new FormData(form)
  })
    .then(response => response.json())
    .then((data) => {
      // Update the results section
      results.innerHTML = data.partial;
      // Make sure the SVGs are loaded properly
      loadSVGs();
      // Remove header and alert
      removeElements();
      // Update the progress bar with the result
      updateProgressBar();
      // Reset form after successful submission
      resetForm();
    })
    .catch(error => {
      console.error('Error fetching results:', error);
    });
}

// Event litener for input & counter
textArea.addEventListener('input', () => updateCounter(textArea, counter, checkIcon));

// Event listener for form submission
form.addEventListener('submit', (event) => {
  event.preventDefault();
  const userInput = textArea.value;

  // Call the getResults function with the user input
  getResults(userInput);
});
