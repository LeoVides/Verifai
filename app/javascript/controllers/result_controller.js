import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="result"
export default class extends Controller {
  static targets = ["fullResult", "form", "button"]

  connect() {
    this.assetPath = this.element.dataset.assetsPath
    this.formTarget.addEventListener('submit', this.preventSubmit);
  }

  preventSubmit(event) {
    event.preventDefault(); // Prevent the form from being submitted
  }

  // Shows the full result
  compute(event) {
    event.preventDefault();

     // Clear the full result target
     this.fullResultTarget.innerHTML = "";

     // Show the full result target
     this.fullResultTarget.classList.remove("d-none");

     if (this.formTarget.querySelector("textarea").value.length < 50) {
      this.formTarget.insertAdjacentHTML('afterend', `<div class="alert alert-danger alert-dismissible fade show m-1" role="alert" data-controller="flash" data-flash-target="message">Your input must contain at least 50 characters. Please try again.</div>`);
      return;
     }

     // Insert the user input and a loader
     const userImagePath = this.assetPath;
     console.log(userImagePath);
     this.fullResultTarget.insertAdjacentHTML("beforeend", `<div class="d-flex justify-content-end mb-5">
                                                                <div class="user-input p-3">
                                                                  <div class="d-flex align-items-center">
                                                                    <img width="24px" src="${userImagePath}">
                                                                    <h3>Input</h3>
                                                                  </div>
                                                                  <p>${this.formTarget.querySelector("textarea").value}</p>
                                                                </div>
                                                              </div>
                                                              <div class="box my-5">
                                                               <div class="loader1"></div>
                                                             </div>`);

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

        // Show a flash message
        this.fullResultTarget.insertAdjacentHTML("beforeend", `<div class="alert alert-info alert-dismissible fade show m-1" role="alert" data-controller="flash" data-flash-target="message">
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
