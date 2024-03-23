// TODO, fichiers à mettre dans lib/admin_panel/component.js

import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import "trestle/admin"

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

// Eager load all components controllers defined in the import map under components/**/*.js
eagerLoadControllersFrom("components", application);

export { application };
