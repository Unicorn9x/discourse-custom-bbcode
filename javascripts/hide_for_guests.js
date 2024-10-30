// javascripts/hide_for_guests.js

import { api } from 'discourse/lib/api';

api.decorateCookedElement((element) => {
  const isLoggedIn = !!api.getCurrentUser();
  
  // Find and hide elements wrapped with the custom BBCode
  element.querySelectorAll('.hide-for-guests').forEach((el) => {
    if (!isLoggedIn) {
      el.style.display = 'none';
    }
  });
});
