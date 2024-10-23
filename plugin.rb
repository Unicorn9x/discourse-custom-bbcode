# frozen_string_literal: true

# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

enabled_site_setting :custom_bbcode_enabled

after_initialize do
  # Register the custom BBCode
  Discourse::Markup.register(:bbcode, 'hide-for-guests') do |content|
    "<div class='hide-for-guests'>#{content}</div>"
  end
  
  # Modify the post serializer to recognize the custom BBCode
  add_to_serializer(:post, :custom_bbcode) do
    object.cooked.gsub(/<div class='hide-for-guests'>(.*?)<\/div>/m, '<div class="hide-for-guests" data-hide-for-guests>$1</div>')
  end
end
