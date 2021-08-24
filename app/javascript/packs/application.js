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


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "flatpickr/dist/flatpickr.css"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../components/init_mapbox';
import { initAutocomplete } from '../components/init_autocomplete';
import { initFlatpickr } from '../components/init_flatpickr';
import { initAos } from 'components/init_aos';
import { initTyped } from 'components/init_typed';
import { initSweetalert } from 'components/init_sweetalert';
import { barRating } from 'components/init_bar_rating';
import 'jquery-bar-rating/dist/themes/css-stars.css';
import { initChatroomCable } from 'channels/chatroom_channel';



// import { initUpdateNavbarOnScroll } from '../components/navbar';

// import { loadDynamicBannerText } from '../components/banner';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // initUpdateNavbarOnScroll();
  // loadDynamicBannerText();
  initMapbox();
  initAutocomplete();
  initFlatpickr();
  initAos();
  initTyped();
  initSweetalert();
  barRating();
  initChatroomCable();
});
