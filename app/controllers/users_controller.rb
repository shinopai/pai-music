class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: %i(get_artists get_albums)

  def get_profile
    @user = User.find(params[:id])

    render 'profile'
  end

  def get_artists
    @artists = Artist.where(user_id: @user).order(created_at: :desc)

    render 'artists'
  end

  def get_albums
    @albums = Album.where(user_id: @user).order(created_at: :desc)

    render 'albums'
  end

  # private
  def get_user
    @user = User.find(params[:user_id])
  end
end
