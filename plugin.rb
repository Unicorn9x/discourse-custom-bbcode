# frozen_string_literal: true

# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

after_initialize do
  # Register the custom BBCode
  Discourse::Markup.register(:bbcode, 'hide-for-guests') do |content|
    "<div class='hide-for-guests'>#{content}</div>"
  end

  # Ensure the custom BBCode is parsed
  add_to_serializer(:post, :hide_for_guests) do
    object.cooked.gsub(/<div class='hide-for-guests'>(.*?)<\/div>/m, '<div class="hide-for-guests" data-hide-for-guests>$1</div>')
  end
end
