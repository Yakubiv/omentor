import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Connected to remote controller")
  }

  load(event) {
    event.preventDefault()
    console.log("Load modal")
  }

  show(event) {
    console.log("Show modal")
    event.preventDefault()

    fetch(this.data.get("endpoint"), {})
      .then(response => response.text())
      .then(html => {
        document.querySelector("body").insertAdjacentHTML('beforeend', html)
      })
  }
}