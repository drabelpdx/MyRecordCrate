class AlbumsController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'pp'
  require 'dotenv'
  require 'http'

  def index

    if (params[:id_c])
      id = params[:id_c]
      password = ENV["DISCOG_TOKEN"]
      @url = params[:page_c]
      HTTP.auth("Discogs token=#{password}")
      .headers('Content-Length'=>'0').accept(:json)
      .post("https://api.discogs.com/users/drabel/collection/folders/608246/releases/#{id}")
    end

    if (params[:id_w])
      id = params[:id_w]
      password = ENV["DISCOG_TOKEN"]
      @url = params[:page_w]
      HTTP.auth("Discogs token=#{password}")
      .headers('Content-Length'=>'0').accept(:json)
      .put("https://api.discogs.com/users/drabel/wants/#{id}")
    end


    @pic = params[:pic]
    @artist = params[:artist]

    if (params[:page])
      url = params[:page]
      @pic = params[:pic]
      @artist = params[:artist]
      @passed_url = params[:page]
    elsif (@url)
      url = @url
    else
      url = params[:url]
      @passed_url = params[:url]
    end
    @pic = params[:pic]
    @artist = params[:artist]
    buffer = open(url).read
    @albums = JSON.parse(buffer)
  end

end
