# #!/usr/bin/ruby
# require 'fileutils'
# require 'digest/md5'
# require 'redcarpet'
# require 'albino'

# require_relative ("/Users/alexkadis/Sites/ak2015/_plugins/RecursiveRenderer.rb")

# class RecursiveRenderer < Redcarpet::Render::HTML
#   def block_html(raw_html)
#     if (md = raw_html.match(/\<(.+?)\>(.*)\<(\/.+?)\>/m))
#       open_tag, content, close_tag = md.captures
#       "\n<#{open_tag}>\n#{render content}<#{close_tag}>\n"
#     else
#       raw_html
#     end
#   end

#   def set_render(&block)
#     @render = block
#   end

#   private
#   def render(markdown)
#     if @render.nil?
#       markdown
#     else
#       @render.call(markdown)
#     end
#   end
# end