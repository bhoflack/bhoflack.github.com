require 'mini_magick'

module Jekyll
    module Thumbnail
        class ThumbnailFile < Jekyll::StaticFile
            def initialize(site, base, dir, name, original, dimensions)
                super(site, base, dir, name)
                @original = original
                @dimensions = dimensions
            end

            def write(dest)
                dest_filename = File.join(dest, @dir, @name)
                return false if File.exist? dest_filename

                thumb = MiniMagick::Image.open(@original)
                thumb.resize(@dimensions)
                thumb.write(dest_filename)
            end
        end
    end
end
