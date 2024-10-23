# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

enabled_site_setting :custom_bbcode_enabled

# Registering the custom BBCode
after_initialize do
  # Modify the post serializer to recognize the custom BBCode
  add_to_class(:post, :cooked) do
    html = super()
    # Convert the custom BBCode to HTML
    html.gsub!(/\[hide-for-guests\](.*?)\[\/hide-for-guests\]/m) do |match|
      content = $1
      "<div class='hide-for-guests'>#{content}</div>"
    end
    html
  end
end
