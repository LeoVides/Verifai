import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="result"
export default class extends Controller {
  static targets = ["fullResult", "form"]

  // Shows the full result
  compute(event) {
    event.preventDefault();

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

        // Show a loading message while waiting for Turbo Stream update
        this.fullResultTarget.classList.remove("d-none");
        this.fullResultTarget.innerHTML = `
          <div class="alert alert-info" role="alert">
            Processing your request... Please wait.
          </div>
        `;

        this.resetForm();
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

  showLoading() {
    this.fullResultTarget.classList.remove("d-none");
    this.fullResultTarget.innerHTML = `
      <div class="d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Processing...</span>
        </div>
        <p class="ms-2">Processing your request... Please wait.</p>
      </div>
    `;
  }

  resetForm() {
    this.formTarget.reset() // Clear all fields in the form
  }
}
