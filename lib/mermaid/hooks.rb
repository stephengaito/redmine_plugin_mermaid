# see: https://mermaid.js.org/intro/#mermaid-api

module RedmineMermaid
  class Hook < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context = {})
      tags = javascript_include_tag 'mermaid.min.js', plugin: 'mermaid'
      # tags += stylesheet_link_tag 'mermaid.css', plugin: 'mermaid'
      tags
    end
  end
end
