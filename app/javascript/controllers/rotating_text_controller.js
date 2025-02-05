import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["text"];

  connect() {
    this.currentIndex = 0;
    this.phrases = [
      {
        content: `
          <span class="greeting-line">IS THE EARTH FLAT?</span>
        `,
        duration: 2000
      },
      {
        content: `
          <span class="greeting-line">HELL NO!!!!</span>
        `,
        duration: 2000
      },
      {
        content: `
          <span class="greeting-line">FIND THE TRUTH</span>
          <span class="greeting-line">–</span>
          <span class="greeting-line">WITH VERIFAI</span>
        `,
        duration: 2000
      }
    ];

    this.startRotation();
  }

  startRotation() {
    this.updateText();
  }

  updateText() {
    this.textTarget.innerHTML = this.phrases[this.currentIndex].content;

    // Stop updating after last phrase and show attributes
    if (this.currentIndex < this.phrases.length - 1) {
      setTimeout(() => {
        this.currentIndex++;
        this.updateText();
      }, this.phrases[this.currentIndex].duration);
    } else {
      setTimeout(() => {
        this.showAttributes();
      }, this.phrases[this.currentIndex].duration);
    }
  }

  showAttributes() {
    const attributesContainer = document.getElementById("attributesContainer");
    attributesContainer.classList.remove("hidden");
    attributesContainer.classList.add("fade-in");
  }
}
