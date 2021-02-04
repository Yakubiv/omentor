import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "overlay", "body" ]

  connect() {
    this.transitionIn()
  }

  disconnect() {
    this.close()
  }

  close() {
    this.transitionOut();

    setTimeout(() => {
      this.element.remove();
    }, 200)
  }

  transitionIn() {
    setTimeout(() => {
      this.overlayTarget.classList.add('opacity-100')
      this.bodyTarget.classList.remove("opacity-0", "translate-y-4", "sm:translate-y-0", "sm:scale-95")
      this.bodyTarget.classList.add("opacity-100", "translate-y-0", "sm:scale-100")
    }, 300);
  }

  transitionOut() {
    this.overlayTarget.classList.remove('opacity-100')
    this.bodyTarget.classList.remove("opacity-100", "translate-y-0", "sm:scale-100")
    this.bodyTarget.classList.add("opacity-0", "translate-y-4", "sm:translate-y-0", "sm:scale-95")
  }

  closeWithEscape(e) {
    if (e.keyCode === 27) {
      this.close();
    }
  }
}