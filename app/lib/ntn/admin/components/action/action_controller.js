import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];

  click(event) {
    if(this.isConfirmCanceled()) {
      return
    }

    if (this.hasFormTarget) {
      console.log("okokook")
      this.submitForm(event, this.formTarget);
      return;
    }

    let type = this.element.dataset.type;

    if (type == "submit") {
      this.submitForm(event, this.element.closest("form"));
      return;
    }

    if (type == "reset") {
      this.reloadFrame(event, this.element.closest("form"));
      return;
    }
  }

  submitForm(event, form) {
    event.preventDefault();
    event.stopImmediatePropagation();

    form.requestSubmit();
  }

  async reloadFrame() {
    this.element.closest("turbo-frame").src = window.location.href;
  }
  
  isConfirmCanceled(event) {
    let confirm = this.element.dataset.confirm;

    if (confirm && !window.confirm(this.element.dataset.confirmText)) {
      event.preventDefault();
      return true;
    }
  }

}
