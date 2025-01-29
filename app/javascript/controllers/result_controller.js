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
    this.fullResultTarget.classList.remove('d-none');

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        if (data.user_input) {
          this.fullResultTarget.innerHTML = `<h2>Result</h2><div>${data.user_input}</div><div><strong>Political bias:</strong>${data.political_bias}. <strong>Fact score:</strong>${data.fact_score}.</div>`;
        }
      })
      .catch((error) => {
        console.error("Error:", error)
      })
  }

  resetForm() {
    console.log("Resetting form inputs")
    this.formTarget.reset() // Clear all fields in the form
  }
}
