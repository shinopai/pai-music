class ItemsController < ApplicationController
  require 'rspotify'

  def index
    @artists = Artist.order(created_at: :desc).limit(8)
    @albums = Album.order(created_at: :desc).limit(8)
  end

  def search
    RSpotify.authenticate('f86989415ca846fea96bbe11eb57013f', '50953df646a249b3816b08341d5befd9')
    @search_word = params[:search_word]
    @search_q = params[:search_q]

    case @search_q
    when 'artist' then
      @results = RSpotify::Artist.search(@search_word)
    when 'title' then
      @results = RSpotify::Album.search(@search_word)
    end
  end

  def get_artists
    @artists = Artist.all.order(created_at: :desc).page(params[:page])

    render 'all_artists'
  end

  def get_albums
    @albums = Album.all.order(created_at: :desc).page(params[:page])

    render 'all_albums'
  end
end
