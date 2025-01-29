import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="result"
export default class extends Controller {
  static targets = ["fullResult", "form"]

  connect() {
  }

  // Shows the full result
  compute(event) {
    event.preventDefault();
    console.log('compute');

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
          console.log(data.media);

          let mediaList = "";
          Object.entries(data.media).forEach(([key, value]) => {
            console.log(key, value);
            mediaList += `<li><strong>${key}:</strong> <a href="${value}" target="_blank">${value}</a></li>`;

          });

          this.fullResultTarget.innerHTML = `
            <h2>Result</h2><div>${data.user_input}</div>
            <div><strong>Political bias:</strong>${data.political_bias}.
            <strong>Fact score:</strong>${data.fact_score}.
            <strong>Read from other sources:<ul>${mediaList}</ul></div>`;
        }
      })
      .catch((error) => {
        console.error("Error:", error);
        if (error.errors) {
          this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger" role="alert">${error.errors.join(", ")}</div>`);
        } else {
          this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger" role="alert">An unexpected error occurred. Please try again.</div>`);
        }
      });
  }

  resetForm() {
    console.log("Resetting form inputs")
    this.formTarget.reset() // Clear all fields in the form
  }
}
