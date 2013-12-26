require 'mini_magick'
require 'pathname'

module Jekyll
    module Gallery
        class GalleryTag < Liquid::Tag
            def initialize(tag_name, path, tokens)
                super
                @path = path.strip
            end

            def render(context)
                response = []
                site = context.registers[:site]
                Dir.glob(File.join(@path, "*.{JPG,jpg}")).each do |img|
                    thumbnail_name = File.basename(img, File.extname(img)) + "_thumb.jpg"
                    thumbnail_path = File.join(@path, thumbnail_name)
                    thumbnail = Jekyll::Thumbnail::ThumbnailFile.new(site, '.', @path, thumbnail_name, img, '640x480')
                    site.static_files= site.static_files << thumbnail
                    response << "<div class=\"row\"><div class=\"small-12 columns image\"><a href=\"/#{relative_url(img, '_site')}\"><img src=\"/#{relative_url(thumbnail_path, '_site')}\"></a></div></div>"
                end
                response.join('<div class="row"><div class="small-12 columns empty">&nbsp;</div></div>')              
            end

            private
            def relative_url(file, base)
                absolute_path = Pathname.new(File.expand_path(file))
                root = Pathname.new(File.expand_path(base))
                absolute_path.relative_path_from(root).to_s
            end
        end
    end
end

Liquid::Template.register_tag('gallery', Jekyll::Gallery::GalleryTag)
