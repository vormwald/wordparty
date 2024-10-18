import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    // Add event listener when the controller connects
    document.addEventListener("click", this.outsideClick.bind(this))
  }

  disconnect() {
    // Remove event listener when the controller disconnects
    document.removeEventListener("click", this.outsideClick.bind(this))
    this.menuTarget.classList.add("hidden")
  }

  toggle(event) {
    event.stopPropagation()
    this.menuTarget.classList.toggle("hidden")
  }

  outsideClick(event) {
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains("hidden")) {
      this.menuTarget.classList.add("hidden")
    }
  }
}
