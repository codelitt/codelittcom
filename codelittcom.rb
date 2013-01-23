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
    serve '/js',     from: 'app/js'        # Optional
    serve '/css',    from: 'app/css'       # Optional
    serve '/images', from: 'app/images'    # Optional
  }

	get '/' do 
		erb :index
	end
end

