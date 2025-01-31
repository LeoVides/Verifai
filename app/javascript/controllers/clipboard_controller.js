import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  copy(event) {
    // Select the input value and copy it to clipboard
    this.inputTarget.select();
    document.execCommand('copy');

    // Disable the button and change the text to feedbackText
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = this.feedbackTextValue;
    const target = event.currentTarget

    setTimeout(function() {
      // Use the captured event object here
      console.log('Captured Event:', target);
      target.disabled = false
      target.innerHTML = '<i class="fas fa-paper-plane"></i>'
    }, 2000);
  }
}
