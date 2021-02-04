import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source", "button", "label"]

  connect() {
    if (!document.queryCommandSupported("copy")) {
      this.element.querySelector('button').classList.add("hidden")
    }
  }

  copy(event) {
    event.preventDefault()
    this.sourceTarget.select()
    document.execCommand("copy")

    if (this.hasLabelTarget) {
      this.labelTarget.innerText = "Copied"
    }
  }
}