import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="result"
export default class extends Controller {
  static targets = ["fullResult", "form", "button"]

  // Shows the full result
  compute(event) {
    event.preventDefault();

    // Call the Rails controller create action
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => {
        if (!response.ok) {
          return response.json().then(err => { throw err });
        }
        return response.json();
      })
      .then((data) => {
        console.log("Background job started:", data);

        // Clear the full result target
        this.fullResultTarget.innerHTML = "";

        // Show the full result target
        this.fullResultTarget.classList.remove("d-none");

        // Insert the user input and a loader
        this.fullResultTarget.insertAdjacentHTML("beforeend", `<div class="box">
                                                                  <p><strong>My input:</strong></p>
                                                                  <p>${data.user_input}</p>
                                                                  <div class="loader1"></div>
                                                                </div>`);
        // Show a flash message
        this.fullResultTarget.insertAdjacentHTML("beforeend", `<div class="alert alert-info" role="alert">
          Processing your request... Please wait.
        </div>`);

        this.resetForm();
        this.buttonTarget.classList.add("disabled");
        setTimeout(() => {
          this.buttonTarget.classList.remove("disabled");
        }, 5000); // Enable button after 5 seconds
      })
      .catch((error) => {
        console.error("Error:", error);
        if (error.errors) {
          this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger alert-dismissible fade show m-1" role="alert" data-controller="flash" data-flash-target="message">${error.errors.join(", ")}</div>`);
        } else {
          this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger alert-dismissible fade show m-1" role="alert" data-controller="flash" data-flash-target="message">An unexpected error occurred. Please try again.</div>`);
        }
      });
  }

  resetForm() {
    this.formTarget.reset() // Clear all fields in the form
  }
}
