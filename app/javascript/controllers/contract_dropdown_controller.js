import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['menu']

  connect() {
    this.toggleClass = this.data.get('class') || 'hidden'
  }

  toggle(event) {
    event.preventDefault()
    this.menuTarget.classList.toggle(this.toggleClass)

    if (!this.data.has('loaded')) {
      this.load()
    }
  }

  load() {
    fetch(this.data.get("url"), {})
      .then(response => response.text())
      .then(html => {
        this.data.set('loaded', true)
        this.menuTarget.innerHTML = html
      })
  }

  hide(event) {
    if (
      this.element.contains(event.target) === false &&
      !this.menuTarget.classList.contains(this.toggleClass)
    ) {
      this.menuTarget.classList.add(this.toggleClass)
    }
  }
}
