import { Controller} from "stimulus"

export default class extends Controller {
  connect() {
    this.element.querySelectorAll("a.active").forEach(link => link.classList.remove('active'))

    let activeLink = this.element.querySelector("a[href^='" + window.location.pathname.slice(0,6) + "']")
    if (activeLink) {
      activeLink.classList.add('active')
    } else {
      this.element.querySelector('a').classList.add('active')
    }
  }

  highlight(event) {
    let activeLink = this.element.querySelector("a.active")
    if (activeLink) {
      activeLink.classList.remove('active')
    }
    event.target.classList.add('active')
  }
}