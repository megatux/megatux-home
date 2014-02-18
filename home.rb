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

  get '/t' do
    slim :t1
  end

  get '/t2' do
    slim :t2, :layout => false
  end

  get /\/(t[1-9]+)/ do |file|
    slim file.to_sym
  end

  # Start the server if ruby file executed directly.
  run! if app_file == $0
end
