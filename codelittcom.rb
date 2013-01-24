require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'sinatra/assetpack'
require 'erb'
require 'uglifier'
require 'sinatra/assetpack'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  Less.paths <<  "#{App.root}/app/css" 

  register Sinatra::AssetPack

  assets do 
    serve '/images', from: 'app/images'    # Optional

    css :bootstrap, [
      '/css/theme.css'
    ]

    js_compression :uglify

    prebuild true
  end

	get '/' do 
		erb :index
	end
end

