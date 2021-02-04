import { Controller } from "stimulus"
import { useClickOutside } from "stimulus-use"
import { enter, leave } from "el-transition";

export default class extends Controller {
  static targets = [ "toggle", "menu" ]
  static values = { remoteUrl: String }

  connect() {
    useClickOutside(this)
  }

  clickOutside() {
    leave(this.menuTarget, "dropdown")
  }

  toggle() {
    if (this.menuTarget.classList.contains("hidden")) {
      enter(this.menuTarget, "dropdown")
    } else {
      leave(this.menuTarget, "dropdown")
    }
  }
}