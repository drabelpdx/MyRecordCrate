class WantsController < ApplicationController

  def index
    require 'open-uri'
    require 'json'
    require 'pp'
    url = "https://api.discogs.com/users/drabel/wants"
    buffer = open(url).read
    @wantlist = JSON.parse(buffer)
  end

end
