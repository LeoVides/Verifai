import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="history-search"
export default class extends Controller {
  submitForm(event) {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 300) // Debounce input
  }
}
