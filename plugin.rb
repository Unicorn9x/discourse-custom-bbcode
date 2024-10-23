# frozen_string_literal: true

# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

enabled_site_setting :custom_bbcode_enabled

after_initialize do
  # Register the custom BBCode
  Discourse::Post.default_cooked_to_html_hooks << Proc.new do |html|
    # This regex captures your custom BBCode
    html.gsub!(/\[hide-for-guests\](.*?)\[\/hide-for-guests\]/m) do |match|
      content = $1
      "<div class='hide-for-guests'>#{content}</div>"
    end
    html
  end
end
