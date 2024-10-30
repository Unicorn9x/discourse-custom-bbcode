// javascripts/hide_for_guests.js.es6

import { api } from 'discourse/lib/api';

api.onPageChange(() => {
  const isLoggedIn = !!api.getCurrentUser();

  // Select elements with the 'hide-for-guests' class
  document.querySelectorAll('.hide-for-guests').forEach((element) => {
    // Hide element if the user is not logged in
    if (!isLoggedIn) {
      element.style.display = 'none';
    }
  });
});
