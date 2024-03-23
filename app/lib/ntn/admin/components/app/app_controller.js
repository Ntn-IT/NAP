import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    this.popstateChangedListener = this.popstateChanged.bind(this)

    addEventListener("popstate", this.popstateChangedListener);
  }

  disconnect() {
    removeEventListener("popstate", this.popstateChangedListener);
  }

  popstateChanged() {
    Turbo.visit(window.location.href, { action: "replace", frame: "app-frame" });
  }
}
