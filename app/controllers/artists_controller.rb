class ArtistsController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'pp'
  require 'dotenv'
  require 'http'
  
  def index

    if params[:search]||params[:artist]||params[:title]
      require 'open-uri'
      require 'json'
      require 'pp'
        request_uri = 'https://api.discogs.com/database/search?q='
        request_query = params[:search]
        artist_query = params[:artist]
        title_query = params[:title]
        url = "#{request_uri}#{request_query}#{artist_query}#{title_query}&token=#{ENV['DISCOG_TOKEN']}"
        buffer = open(url).read
        @artists = JSON.parse(buffer)
    end

    if params[:page]
      url = params[:page]
      buffer = open(url).read
      @artists = JSON.parse(buffer)
    end

  end

  def show
    require 'open-uri'
    require 'json'
    require 'pp'
      @pic = params[:pic]
      request = params[:url]
      url = "#{request}#{ENV['DISCOG_AUTH']}"
      buffer = open(url).read
      @results = JSON.parse(buffer)
  end

end
