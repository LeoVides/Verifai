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

    // Reset the button after 2 seconds
    setTimeout(() => {
      event.currentTarget.disabled = false;
      event.currentTarget.innerText = 'Copy to Clipboard';  // Reset the button text
    }, 2000); // 2000 milliseconds = 2 seconds
  }
}
