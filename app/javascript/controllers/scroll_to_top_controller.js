import { Controller } from "@hotwired/stimulus"

// Shows the floating up-arrow once scrolled past 500px and scrolls smooth on click.
export default class extends Controller {
  connect() {
    this.onScroll = this.onScroll.bind(this)
    window.addEventListener("scroll", this.onScroll, { passive: true })
    this.onScroll()
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll)
  }

  onScroll() {
    this.element.style.display = window.scrollY > 500 ? "block" : "none"
  }

  scroll(event) {
    event.preventDefault()
    window.scrollTo({ top: 0, behavior: "smooth" })
  }
}
