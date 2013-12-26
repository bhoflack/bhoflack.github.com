require 'mini_magick'

module Jekyll
    module Thumbnail
        class ThumbnailGenerator < Jekyll::Generator

            def generate(site)
                front_images = site.posts.map { |post| post.data["front_image"] }
                with_front_images = front_images.select { |fi| not fi.nil? }
                thumbnails = with_front_images.map do |image| 
                    thumbnail_name = File.basename(image, File.extname(image)) + '_front.jpg'
                    ThumbnailFile.new(site, '.', File.dirname(image), thumbnail_name, absolute_to_relative(image), "160x80")
                end
                site.static_files= site.static_files.concat(thumbnails)
            end

            private
            def absolute_to_relative(path)
                path[1..path.length - 1]
            end
        end

        module ThumbnailFilter
            def thumbnail(url)
                return "/images/placeholder.jpg" unless not url.nil?
                thumbnail_name = File.basename(url, File.extname(url)) + '_front.jpg'
                File.join(File.dirname(url), thumbnail_name) 
            end
        end
    end
end

Liquid::Template.register_filter(Jekyll::Thumbnail::ThumbnailFilter)
