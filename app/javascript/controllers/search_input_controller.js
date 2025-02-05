import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-input"
export default class extends Controller {
  static targets = ["input", "speechButton"];

  connect() {

    // Update counter as user types
    this.updateCounter();

    // Adjust height as user types
    this.adjustHeight();

    // voice recorder
    if (!("webkitSpeechRecognition" in window)) {
      alert("Speech recognition is not supported in this browser.");
      return;
    }

    this.recognition = new webkitSpeechRecognition();
    this.recognition.continuous = false;
    this.recognition.interimResults = false;
    this.recognition.lang = "en-US"; // Change as needed

    this.recognition.onresult = (event) => {
      this.inputTarget.value = event.results[0][0].transcript; // Fill input with recognized speech
      this.updateCounter();
      this.speechButtonTarget.classList.remove("fa-beat-fade");
    };

    this.recognition.onerror = (event) => {
      console.error("Speech recognition error:", event.error);
    };
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

  adjustHeight() {
    this.inputTarget.style.height = "auto"; // Reset height
    this.inputTarget.style.height = this.inputTarget.scrollHeight + "px"; // Set new height
  }

  count() {
    this.updateCounter();
  }

  startSpeech() {
    this.speechButtonTarget.classList.add("fa-beat-fade");
    this.recognition.start();
  }
}
