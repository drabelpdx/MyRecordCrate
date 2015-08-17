class CollectionsController < ApplicationController

  def index
    require 'open-uri'
    require 'json'
    require 'pp'
    pic = params[:pic]
    artist = params[:artist]
    url = "https://api.discogs.com/users/drabel/collection/folders/608246/releases?token=#{ENV['DISCOG_TOKEN']}"
      buffer = open(url).read
      @collections = JSON.parse(buffer)
  end

end
