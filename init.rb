require 'redmine'

# This is a horible HACK... but I don't know the official way to add this
# plugin's paths to the ruby $LOAD_PATH... so since this works... we use
# it!
#lib = File.expand_path '../lib', __FILE__
#$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

require_dependency 'lib/mermaid/hooks'


Redmine::Plugin.register :mermaid do
  name 'Redmine Mermaid plugin'
  author 'Stephen Gaito'
  description 'This is a mermaid.js plugin for Redmine'
  version '0.0.3'
  url 'https://github.com/stephengaito/redmine_plugin_mermaid'
  author_url 'https://github.com/stephengaito'

  Redmine::WikiFormatting::Macros.register do
    desc 'Wiki/Issues mermaid'
    macro :mermaid do |obj, args, text|
      html = content_tag('div', text, :class => 'mermaid')
      html += javascript_tag(
	      "$('div.mermaid:not([data-processed])').each(" +
	      "  function () { mermaid.init(undefined, this); }" +
	      ");"
      )
      html
    end
  end
end
