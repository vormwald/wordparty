import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.closeMenu()
  }

  toggleMenu() {
    if (this.menuTarget.classList.contains("hidden")) {
      this.openMenu()
    } else {
      this.closeMenu()
    }
  }

  openMenu() {
    this.menuTarget.classList.remove("hidden")
  }

  closeMenu() {
    this.menuTarget.classList.add("hidden")
  }

  // Close the menu when clicking outside of it
  clickOutside(event) {
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains("hidden")) {
      this.closeMenu()
    }
  }
}
