class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
    # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    #   marker.lat user.latitude
    #   marker.lng user.longitude
    #   marker.title user.title
    # end
  end
