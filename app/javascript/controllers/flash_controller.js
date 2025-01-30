import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["message"]

  connect() {
    this.startTimeout();
  }

  startTimeout() {
    setTimeout(() => {
      this.dismiss_flashes();
    }, 5000); // Flash disappears after 3 seconds
  }

  dismiss_flashes() {
    this.messageTargets.forEach((message) => {
      message.classList.add("fade-out");
      setTimeout(() => message.remove(), 1000); // Wait for animation to finish before removing
    });
  }
}
