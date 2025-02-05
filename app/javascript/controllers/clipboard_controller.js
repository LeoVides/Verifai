import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String } // Store the URL as a data attribute

  copy() {
    navigator.clipboard.writeText(this.urlValue)
      .then(() => {
        console.log(this.eventTarget);
        document.querySelector("#top-bar").insertAdjacentHTML("beforeend", `<div class="alert alert-info alert-dismissible fade show m-1" role="alert" data-controller="flash" data-flash-target="message">
          URL copied to clipboard!
        </div>`);
      })
      .catch(err => console.error("Failed to copy URL:", err));
  }
}
