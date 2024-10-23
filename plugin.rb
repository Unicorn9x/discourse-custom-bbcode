# frozen_string_literal: true

# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

after_initialize do
  # Register the custom BBCode
  Discourse::Markup.register_bbcode(
    'hide-for-guests', 
    '<div class="hide-for-guests">%{content}</div>'
  )
end
