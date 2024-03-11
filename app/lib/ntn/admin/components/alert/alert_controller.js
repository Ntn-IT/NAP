import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["backtrace"];

  close() {
    this.element.remove();
  }

  toogleBacktrace() {
    this.backtraceTarget.classList.toggle("open");
  }
}
