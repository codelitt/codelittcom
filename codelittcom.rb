require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'sinatra/assetpack'
require 'erb'
require 'uglifier'
require 'sinatra/assetpack'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack

  assets {
    serve '/images', from: 'app/images'    # Optional

    css :bootstrap, [
      '/css/theme.css',
      '/css/bootstrap-responsive.css'
    ]

    js_compression :uglify

    prebuild true
  }

	get '/' do 
		erb :index
	end
end

