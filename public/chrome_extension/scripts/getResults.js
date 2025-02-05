export function getResults(userInput, results, form) {
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

  fetch(form.action, {
    method: "POST",
    mode: "no-cors",
    headers: { "Accept": "application/json" },
    body: new FormData(form)
  })
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = data.partial;

      // Make sure the SVGs are loaded properly
      loadSVGs();
      // Remove header and alert
      removeElements();
      // Update the progress bar with the result
      updateProgressBar();
      // Reset form after successful submission
      resetForm();
    });
}
