import { Controller } from "@hotwired/stimulus"

// Mega-menu dropdown toggle. Closes when clicking outside the dropdown.
export default class extends Controller {
  connect() {
    this.onDocumentClick = this.onDocumentClick.bind(this)
    document.addEventListener("click", this.onDocumentClick)
  }

  disconnect() {
    document.removeEventListener("click", this.onDocumentClick)
  }

  toggle(event) {
    event.stopPropagation()
    const wasOpen = this.element.classList.contains("open")
    this.closeAll()
    if (!wasOpen) {
      this.element.classList.add("open")
      const menu = this.element.querySelector(".mega-menu")
      if (menu) menu.classList.add("open")
    }
  }

  onDocumentClick(event) {
    if (!this.element.contains(event.target)) {
      this.element.classList.remove("open")
      const menu = this.element.querySelector(".mega-menu")
      if (menu) menu.classList.remove("open")
    }
  }

  closeAll() {
    document.querySelectorAll(".mega-dropdown.open").forEach((el) => {
      el.classList.remove("open")
      const menu = el.querySelector(".mega-menu")
      if (menu) menu.classList.remove("open")
    })
  }
}
