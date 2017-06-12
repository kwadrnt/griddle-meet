class TrucksController < ApplicationController
  def new
    @truck = Truck.new
  end

  def index
    @trucks = Truck.all
  end

  def create

  end

end
