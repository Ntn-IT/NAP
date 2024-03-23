import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    this.loaderClassList = document.getElementById("loader").classList;

    // [
    //   "turbo:click fires",
    //   "turbo:before-visit",
    //   "turbo:visit fires",
    //   "turbo:submit-start",
    //   "turbo:before-fetch-request",
    //   "turbo:before-fetch-response",
    //   "turbo:submit-end",
    //   "turbo:before-cache",
    //   "turbo:before-build",
    //   "turbo:before-stream-build",
    //   "turbo:build fires",
    //   "turbo:load fires",
    //   "turbo:before-frame-build",
    //   "turbo:frame-build",
    //   "turbo:frame-load",
    //   "turbo:frame-missing",
    //   "turbo:fetch-request-error",
    // ].forEach(ev => {
    //   addEventListener(ev, (event) => {
    //     console.log(ev)
    //   })
    // })
    
    this.addLoaderListeners();
  }

  disconnect(event) {
    removeEventListener("turbo:before-fetch-request", this.addLoaderListener);
    removeEventListener("turbo:before-visit", this.removeLoaderListener);
    removeEventListener("turbo:before-cache", this.removeLoaderListener);
  }

  addLoaderListeners() {
    this.addLoaderListener = this.addLoader.bind(this);
    this.removeLoaderListener = this.removeLoader.bind(this);

    addEventListener("turbo:before-fetch-request", this.addLoaderListener);
    addEventListener("turbo:before-visit", this.removeLoaderListener);
    addEventListener("turbo:before-cache", this.removeLoaderListener);
  }

  removeLoader() {
    console.log("evremoveLoader")
    this.loaderClassList.add("hidden");
  }

  addLoader() {
    console.log("addLoader")
    this.loaderClassList.remove("hidden");
  }
}
