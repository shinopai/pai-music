class ArtistsController < ApplicationController
  def confirm
    # render plain: params[:result].inspect
    @user_id = params[:user_id]
    @name = params[:result][0]['name']
    @spotify_id = params[:result][0]['id']
    @image = params[:result][0][:images]['url']
    @spotify_url = params[:result][0][:url]['spotify']
    @genre = params[:result][0]['genre']
  end

  def create
    # render plain: params.inspect
    if !params[:genre].empty?
      res = Genre.where(name: params[:genre]).select(:id).first
      if res.nil?
        genre = Genre.new
        genre.name = params[:genre]
        genre.save
        genre_id = Genre.order(created_at: :desc).first.id
      else
        genre_id = Genre.where(name: params[:genre]).first.id
      end
    end

      logger.debug('ここから')
      logger.debug(artist_params[:name])
      logger.debug('ここまで')

      user = User.find(params[:user_id])
      artist = user.artists.new
      artist.name = artist_params[:name]
      artist.spotify_id = artist_params[:spotify_id]
      artist.image = artist_params[:image]
      artist.spotify_url = artist_params[:spotify_url]
      if genre_id.present?
        artist.genre_id = genre_id
      end
      artist.save

      redirect_to root_path
  end


  # private
  def artist_params
    params.permit(:name, :spotify_id, :image, :spotify_url, :genre_id)
  end
end
