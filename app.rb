require 'sinatra'
require "sinatra/activerecord"

require 'dotenv'
Dotenv.load

require './hotel_scraper_api'

require './hotel_controller'