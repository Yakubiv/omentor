import { Controller } from "stimulus";
import { enter, leave } from "el-transition";

export default class extends Controller {
  static targets = ["overlay", "panel"];

  connect() {
    this.open();
  }

  open() {
    this.element.classList.remove("invisible");
    enter(this.overlayTarget);
    enter(this.panelTarget);
  }

  close() {
    this.element.remove();
    leave(this.overlayTarget);
    leave(this.panelTarget);
  }
}
