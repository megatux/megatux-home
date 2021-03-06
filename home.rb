require 'bundler'
Bundler.require

$:.unshift File.dirname(__FILE__)

class Home < Sinatra::Base
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html

    def image_tag(source, options='')
      '<img src="%s" %s>' % [source, options]
    end

    def link_to(body, url, options='')
      '<a href="%s" %s>%s</a>' % [url, options, body]
    end

    def author_name
      'Cristian Molina'
    end
  end

  get '/' do
    slim :index
  end

  # Start the server if ruby file executed directly.
  run! if app_file == $0
end
