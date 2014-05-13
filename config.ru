require 'dotenv'
require 'sinatra/base'
require 'sinatra/reloader'
require './app'

Dotenv.load
run Djif
