import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ['list']

  connect() {
    let activeChat = this.element.querySelector("a[href='" + window.location.pathname + "']")
    if (activeChat) {
      activeChat.classList.add('active')
    }
  }

  highlight(event) {
    let activeLink = this.listTarget.querySelector("a.active")
    if (activeLink) {
      activeLink.classList.remove('active')
    }
    event.target.closest('a').classList.add('active')
  }
}