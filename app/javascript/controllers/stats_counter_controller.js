import { Controller } from "@hotwired/stimulus"

// Animates `.count` numeric counters when the section scrolls into view.
// Replicates the inline script from _new_about_us.html.erb in syftetltd.
export default class extends Controller {
  connect() {
    const foundingYear = 2015
    const yearsOfExperience = new Date().getFullYear() - foundingYear

    const experienceEl = this.element.querySelector('.stat[data-type="experience"] .count')
    if (experienceEl) experienceEl.setAttribute("data-count", yearsOfExperience)

    this.counters = this.element.querySelectorAll(".count")
    this.animated = false

    this.observer = new IntersectionObserver((entries, obs) => {
      entries.forEach(entry => {
        if (entry.isIntersecting && !this.animated) {
          this.animated = true
          this.animate()
          obs.unobserve(entry.target)
        }
      })
    }, { threshold: 0.5 })

    this.observer.observe(this.element)
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
  }

  animate() {
    this.counters.forEach((counter) => {
      const target = +counter.getAttribute("data-count")
      const duration = 2000
      const start = performance.now()
      const tick = (now) => {
        const progress = Math.min((now - start) / duration, 1)
        counter.innerText = Math.floor(progress * target)
        if (progress < 1) requestAnimationFrame(tick)
        else counter.innerText = target
      }
      requestAnimationFrame(tick)
    })
  }
}
