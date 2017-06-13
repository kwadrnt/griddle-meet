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
    marker.title truck.name
    marker.infowindow render_to_string(:partial => "/users/info",
        :locals => { :truck => truck}) # allows use of |truck| in partial
  end

  end

  def show
    @user = User.find(params[:id])
    if @user == nil
      redirect_to '/'
    end
  end

end
