class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @trucks = Truck.all
    @hash = Gmaps4rails.build_markers(@trucks) do |truck, marker|
    marker.lat truck.latitude
    marker.lng truck.longitude
    marker.infowindow truck.name
  end

  end

  def show
    @user = User.find(params[:id])
    if @user == nil
      redirect_to '/'
    end
  end

end
