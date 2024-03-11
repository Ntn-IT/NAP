import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    this.loaderClassList = document.getElementById("loader").classList;

    this.addLoaderListeners();
  }

  disconnect(event) {
    removeEventListener("turbo:before-fetch-request", this.addLoaderListener);
    removeEventListener("turbo:before-visit", this.removeLoaderListener);
    removeEventListener("turbo:frame-missing", this.removeLoaderListener);
    removeEventListener("turbo:frame-load", this.removeLoaderListener);
  }

  addLoaderListeners() {
    this.addLoaderListener = this.addLoader.bind(this);
    this.removeLoaderListener = this.removeLoader.bind(this);

    addEventListener("turbo:before-fetch-request", this.addLoaderListener);
    addEventListener("turbo:before-visit", this.removeLoaderListener);
    addEventListener("turbo:frame-missing", this.removeLoaderListener);
    addEventListener("turbo:frame-load", this.removeLoaderListener);
  }

  removeLoader() {
    this.loaderClassList.add("hidden");
  }

  addLoader() {
    this.loaderClassList.remove("hidden");
  }
}
