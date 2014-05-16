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

    json_for(gif_url, search)
  end

  post '/hipchat' do
    content_type :json

    search = params[:search]
    gif_url = get_gif_url(search)

    json_for(gif_url, search)
  end

  def json_for(gif_url, search)
    text = gif_url || "No Gif found for “#{search.strip}”"
    { text: text }.to_json
  end

  def get_gif_url(search = '')
    search.strip!
    search = URI::encode(search)

    limit = 25
    offset = 0

    response = HTTParty.get("http://api.giphy.com/v1/gifs/random?api_key=#{ENV['GIPHY_API_KEY']}&tag=#{search}")
    gif = response['data']

    return nil unless gif.any?
    gif['image_original_url']
  end
end
