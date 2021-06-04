// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:before-cache', () => {
  // Manually tear down bootstrap modals before caching. If turbolinks
  // caches the modal then tries to restore it, it breaks bootstrap's JS.
  // We can't just use bootstrap's `modal('close')` method because it is async.
  // Turbolinks will cache the page before it finishes running.
  if (document.body.classList.contains('modal-open')) {
    $('.modal')
      .hide()
      .removeAttr('aria-modal')
      .attr('aria-hidden', 'true');
    $('.modal-backdrop').remove();
    $('body').removeClass('modal-open');
  }
});