require 'dotenv'
require 'sinatra/base'
require 'sinatra/reloader'
require './app'

if ENV['RACK_ENV'] == 'production'
  require 'newrelic_rpm'
end

Dotenv.load
run Djif
