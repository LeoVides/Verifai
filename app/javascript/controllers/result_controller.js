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
          this.fullResultTarget.innerHTML = `
            <p><strong>Answer</strong></p>
            <div>
              ${data.user_input}
            </div>
            <div class="row">
              <div class="col col-6 col-md-4 col-lg-4">
                <div class="card-saved">
                  <div class="row-saved">
                    <h2>Political bias</h2>
                    <p class="tag">${data.political_bias}</p>
                  </div>
                </div>
              </div>
              <div class="col col-6 col-md-4 col-lg-4">
                <div class="card-saved">
                  <div class="row-saved">
                    <h2>Fact score</h2>
                    <p class="tag">${data.fact_score}</p>
                  </div>
                </div>
              </div>
            </div>`;
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
