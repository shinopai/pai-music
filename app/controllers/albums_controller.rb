class AlbumsController < ApplicationController
  before_action :authenticate_user!

  require 'rspotify'

  def confirm
    @user_id = params[:user_id]
    @name = params[:result][0]['name']
    @spotify_id = params[:result][0]['id']
    @image = params[:result][0][:images]['url']
    @spotify_url = params[:result][0][:url]['spotify']
    @release_date = params[:result][0]['release']
    @type = params[:result][0]['type']
    end

  def create
    logger.debug('--------')
    logger.debug(album_params)
    logger.debug('--------')
    user = User.find(params[:user_id])
    album = user.albums.new
    album.name = album_params[:name]
    album.spotify_id = album_params[:spotify_id]
    album.image = album_params[:image]
    album.spotify_url = album_params[:spotify_url]
    album.release_date = album_params[:release_date]
    album.format_type = album_params[:format_type]
    album.save

    redirect_to root_path
  end

  def show
    RSpotify.authenticate('f86989415ca846fea96bbe11eb57013f', '50953df646a249b3816b08341d5befd9')

    @album = Album.find(params[:id])
    @result = RSpotify::Album.find(@album.spotify_id)
  end


  # private
  def album_params
    params.permit(:name, :spotify_id, :image, :spotify_url, :release_date, :format_type)
  end
end
