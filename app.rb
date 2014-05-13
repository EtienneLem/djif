require 'httparty'
require 'awesome_print'

class Djif < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    erb :application
  end

  post '/slack' do
    content_type :json

    trigger = params[:trigger_word]
    search = params[:text].split(trigger)[1]
    gif_url = get_gif_url(search)

    { text: gif_url }.to_json
  end

  post '/hipchat' do
    content_type :json

    search = params[:search]
    gif_url = get_gif_url(search)

    { text: gif_url }.to_json
  end

  def get_gif_url(search = '')
    search.strip!
    search = URI::encode(search)

    limit = 25
    offset = 0

    response = HTTParty.get("http://api.giphy.com/v1/gifs/random?api_key=#{ENV['GIPHY_API_KEY']}&tag=#{search}")
    gif = response['data']

    gif['image_original_url']
  end
end
