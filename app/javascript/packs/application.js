// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require ("jquery")
import "bulma/css/bulma.css"
import "../../../node_modules/bulma/css/bulma.css"
import bulmaQuickview from 'bulma-quickview/src/js'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {
  let quickviews = bulmaQuickview.attach()

  const fileInput = document.querySelectorAll('input[type=file].file-input')
  fileInput.forEach(input => {
    input.onchange = () => {
      if (input.files.length > 0) {
        const fileName = input.parentNode.querySelector(".file-name")
        fileName.textContent = input.files[0].name
      }
    }
  })
})


$(document).on('turbolinks:load', function() {

  // Check for click events on the navbar burger icon
  $(".navbar-burger").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

  });
});

$(document).on('turbolinks:load', function() {

  // Check for click events on the navbar burger icon
  $(".navbar-item.dropdown").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-item.dropdown").toggleClass("is-active");
  });
});

$(document).on('turbolinks:load', function() {

  // Check for click events on the navbar burger icon
  $(".navbar-item.has-dropdown").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-item.has-dropdown").toggleClass("is-active");
  });
});
