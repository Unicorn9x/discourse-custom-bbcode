# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

register_asset "javascripts/hide_for_guests.js" # Path to your JS file

after_initialize do
  # Register the custom BBCode
  DiscourseMarkup::register_bbcode(
    'hide-for-guests', 
    '<div class="hide-for-guests">%{content}</div>'
  )
end
