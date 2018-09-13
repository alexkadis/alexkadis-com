# require 'fileutils'
# require 'digest/md5'
# require 'redcarpet'
# require 'albino'

# PYGMENTS_CACHE_DIR = File.expand_path('../../_cache', __FILE__)
# FileUtils.mkdir_p(PYGMENTS_CACHE_DIR)

# class Redcarpet2Markdown < Redcarpet::Render::HTML
#   # def block_html(raw_html)
#   #   if (md = raw_html.match(/\<(.+?)\>(.*)\<(\/.+?)\>/m))
#   #     open_tag, content, close_tag = md.captures
#   #     "\n<#{open_tag}>\n#{render content}<#{close_tag}>\n"
#   #   else
#   #     raw_html
#   #   end
#   # end

#   # def set_render(&block)
#   #   @render = block
#   # end

#   # private
#   # def render(markdown)
#   #   if @render.nil?
#   #     markdown
#   #   else
#   #     @render.call(markdown)
#   #   end
#   # end

#   # def block_code(code, lang)
#   #   lang = lang || "text"
#   #   path = File.join(PYGMENTS_CACHE_DIR, "#{lang}-#{Digest::MD5.hexdigest code}.html")
#   #   cache(path) do
#   #     colorized = Albino.colorize(code, lang.downcase)
#   #     add_code_tags(colorized, lang)
#   #   end
#   # end

#   def add_figure(code, lang)
#     code.sub(/\[figure\]/, "<figure>").
#          sub(/\[\/figure\]/, "</figure>")
#   end

#   def add_code_tags(code, lang)
#     code.sub(/<pre>/, "<pre><code class=\"#{lang}\">").
#          sub(/<\/pre>/, "</code></pre>")
#   end

#   def cache(path)
#     if File.exist?(path)
#       File.read(path)
#     else
#       content = yield
#       File.open(path, 'w') {|f| f.print(content) }
#       content
#     end
#   end
# end

# class Jekyll::MarkdownConverter
#   def extensions
#     Hash[ *@config['redcarpet']['extensions'].map {|e| [e.to_sym, true] }.flatten ]
#   end

#   def markdown
#     @markdown ||= Redcarpet::Markdown.new(Redcarpet2Markdown.new(extensions), extensions)
#   end

#   def convert(content)
#     return super unless @config['markdown'] == 'redcarpet2'
#     markdown.render(content)
#   end
# end
