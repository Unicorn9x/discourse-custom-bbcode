# name: discourse-custom-bbcode
# about: A plugin to add custom BBCode for hiding content from guests.
# version: 0.1
# authors: Unicorn9x

enabled_site_setting :custom_bbcode_enabled

after_initialize do
  # Hook into the post processing pipeline to replace custom BBCode with HTML
  on(:post_process_cooked) do |doc, post|
    doc.css("hide-for-guests").each do |element|
      # Replace custom BBCode with a div containing the hidden content
      content = element.inner_html
      replacement = "<div class='hide-for-guests'>#{content}</div>"
      element.replace(replacement)
    end
  end
end
