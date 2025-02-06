import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fact-score-bar"
export default class extends Controller {
  connect() {
    const progressBar = this.element;
    const targetWidth = progressBar.getAttribute("aria-valuenow");

    progressBar.style.width = "0%"; // Start from 0
    setTimeout(() => {
      progressBar.style.transition = "width 1.5s ease-out";
      progressBar.style.width = targetWidth + "%"; // Animate to target width
      progressBar.style.backgroundColor = "#475569"; // Set color 
    }, 200);
  }
}
