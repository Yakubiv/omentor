import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["overlay", "panel"];

  connect() {
    this.open();
  }

  open() {
    this.element.classList.remove("invisible");
    this.overlayTarget.classList.remove("opacity-0", "ease-in", "duration-200");
    this.panelTarget.classList.remove(
      "ease-in",
      "duration-200",
      "opacity-0",
      "translate-y-4",
      "sm:translate-y-0",
      "sm:scale-95"
    );

    this.element.classList.add("visible");
    this.overlayTarget.classList.add("opacity-75", "ease-out", "duration-300");
    this.panelTarget.classList.add(
      "ease-out",
      "duration-300",
      "opacity-100",
      "translate-y-0",
      "sm:scale-100"
    );
  }

  close() {
    this.element.classList.remove("visible");
    this.overlayTarget.classList.remove(
      "opacity-75",
      "ease-out",
      "duration-300"
    );
    this.panelTarget.classList.remove(
      "ease-out",
      "duration-300",
      "opacity-100",
      "translate-y-0",
      "sm:scale-100"
    );

    this.element.classList.add("invisible");
    this.overlayTarget.classList.add("opacity-0", "ease-in", "duration-200");
    this.panelTarget.classList.add(
      "ease-in",
      "duration-200",
      "opacity-0",
      "translate-y-4",
      "sm:translate-y-0",
      "sm:scale-95"
    );
  }
}
