import { Controller } from "@hotwired/stimulus"

// Validates first/last name + email on Submit click and submits the form.
// Mirrors the inline script in _new_contact_form.html.erb in syftetltd.
export default class extends Controller {
  static nameRegex  = /^[A-Za-z\s'-]+$/
  static emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/

  connect() {
    this.element.querySelectorAll(".form-group select").forEach(select => {
      const toggle = () => select.classList.toggle("active", select.value !== "")
      toggle()
      select.addEventListener("change", toggle)
    })

    this.element.addEventListener("ajax:success", () => {
      this.element.reset()
      this.element.querySelectorAll(".error-message").forEach(el => el.innerHTML = "")
      this.element.querySelectorAll(".form-group select").forEach(el => el.classList.remove("active"))
    })
  }

  validateAndSubmit(event) {
    event.preventDefault()
    const firstName = this.element.querySelector("#contact_list_first_name")
    const lastName  = this.element.querySelector("#contact_list_last_name")
    const email     = this.element.querySelector("#contact_list_email")

    let valid = true
    if (!this.constructor.nameRegex.test(firstName.value.trim())) {
      this.showError(firstName, "Please enter a valid first name."); valid = false
    } else this.clearError(firstName)

    if (!this.constructor.nameRegex.test(lastName.value.trim())) {
      this.showError(lastName, "Please enter a valid last name."); valid = false
    } else this.clearError(lastName)

    if (!this.constructor.emailRegex.test(email.value.trim())) {
      this.showError(email, "Please enter a valid email address."); valid = false
    } else this.clearError(email)

    if (valid) this.element.requestSubmit()
  }

  showError(input, message) {
    const container = input.parentNode.querySelector(".error-message")
    container.innerHTML = `<span style="color: #cc0000; font-size: 14px !important;">&#9888; ${message}</span>`
    container.style.display = "block"
    input.style.borderBottom = "1px solid #cc0000"
  }

  clearError(input) {
    const container = input.parentNode.querySelector(".error-message")
    container.innerHTML = ""
    container.style.display = "none"
    input.style.border = ""
    input.style.boxShadow = ""
  }
}
