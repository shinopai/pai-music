class ItemsController < ApplicationController
  require 'rspotify'

  def index
  end

  def search
    RSpotify.authenticate('f86989415ca846fea96bbe11eb57013f', '50953df646a249b3816b08341d5befd9')
    @search_word = params[:search_word]
    search_q = params[:search_q]

    case search_q
    when 'artist' then
      @results = RSpotify::Artist.search(@search_word)
    when 'title' then
      @results = RSpotify::Album.search(@search_word)
    else
      @results = RSpotify::Album.search(@search_word)
    end
  end
end
