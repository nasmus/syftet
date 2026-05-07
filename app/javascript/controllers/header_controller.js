import { Controller } from "@hotwired/stimulus"

// Manages the fixed top header: scroll-state and mobile hamburger toggle.
export default class extends Controller {
  static targets = ["root", "hamburger", "navContainer"]

  connect() {
    this.onScroll = this.onScroll.bind(this)
    window.addEventListener("scroll", this.onScroll, { passive: true })
    this.onScroll()
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
  }

  onScroll() {
    if (window.scrollY > 30) {
      this.rootTarget.classList.add("scrolled", "bg-secondary")
      this.rootTarget.classList.remove("bg-primary")
    } else {
      this.rootTarget.classList.remove("scrolled", "bg-secondary")
      this.rootTarget.classList.add("bg-primary")
    }
  }

  toggleMobile() {
    this.hamburgerTarget.classList.toggle("active")
    const open = this.navContainerTarget.dataset.open === "true"
    this.navContainerTarget.dataset.open = open ? "false" : "true"
  }
}
