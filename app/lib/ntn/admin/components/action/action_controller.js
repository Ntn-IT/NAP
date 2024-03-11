import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];

  click(event) {
    if(this.isConfirmCanceled()) {
      return
    }

    if (this.hasFormTarget) {
      this.submitForm(event, this.formTarget);
    }
  }

  submitForm(event, form) {
    event.preventDefault();
    event.stopImmediatePropagation();

    form.requestSubmit();
  }

  isConfirmCanceled(event) {
    let confirm = this.element.dataset.confirm;

    if (confirm && !window.confirm(this.element.dataset.confirmText)) {
      event.preventDefault();
      return true;
    }
  }

}
