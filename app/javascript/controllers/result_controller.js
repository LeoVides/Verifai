import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="result"
export default class extends Controller {
  static targets = ["fullResult", "form"]

  connect() {
  }

  // Shows the full result
  compute(event) {
    event.preventDefault();
    const current_alert = document.querySelector('.alert');
    if (current_alert != null) {
      current_alert.remove();
    }

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
        console.log(data);
        if (data.user_input) {
          this.fullResultTarget.classList.remove('d-none');
          this.fullResultTarget.innerHTML = `<h2>Result</h2><div>${data.user_input}</div><div><strong>Political bias:</strong>${data.political_bias}. <strong>Fact score:</strong>${data.fact_score}.</div>`;
          this.fullResultTarget.insertAdjacentHTML('afterend', `<div class="alert alert-success alert-dismissible fade show m-1" role="alert">Success! Your now have ${data.user_checker_score} checker points! <i class="fa-solid fa-thumbs-up fa-bounce fa-lg"></i></div>`);
        }
      })
      .catch((error) => {
        console.error("Error:", error);
        if (error.errors) {
          this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger alert-dismissible fade show m-1" role="alert">${error.errors.join(", ")}</div>`);
        } else {
          this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger alert-dismissible fade show m-1" role="alert">An unexpected error occurred. Please try again.</div>`);
        }
      });
  }

  resetForm() {
    console.log("Resetting form inputs")
    this.formTarget.reset() // Clear all fields in the form
  }
}
