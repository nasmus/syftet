import { Controller } from "@hotwired/stimulus"

// Loads a Lottie animation into the element. Uses the global `lottie` from the
// CDN script tag in the layout.
export default class extends Controller {
  static values = { path: String }

  connect() {
    if (typeof window.lottie === "undefined") {
      this._tries = (this._tries || 0) + 1
      if (this._tries < 40) setTimeout(() => this.connect(), 75)
      return
    }
    this.animation = window.lottie.loadAnimation({
      container: this.element,
      renderer: "svg",
      loop: true,
      autoplay: true,
      path: this.pathValue
    })
  }

  disconnect() {
    if (this.animation) this.animation.destroy()
  }
}
