import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="char-counter"
export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.updateCounter();
  }

  updateCounter() {
    const counter = document.getElementById("char-count");
    counter.textContent = this.inputTarget.value.length;
    const checkIcon = document.getElementById("char-count-icn");
    if (this.inputTarget.value.length > 50 && this.inputTarget.value.length < 5000) {
      checkIcon.classList.remove('d-none');
    } else {
      checkIcon.classList.add('d-none');
    }
  }

  count() {
    this.updateCounter();
  }
}
