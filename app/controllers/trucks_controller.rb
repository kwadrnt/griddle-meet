class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @trucks = @user.trucks.all
  end
  # GET /lists/1
  # GET /lists/1.json
  def show
    @user = set_user
    @truck = set_truck
  end
  # GET /lists/new
  def new
    @truck = Truck.new
    @user = set_user
  end
  # GET /lists/1/edit
  def edit
    @user = set_user
    @truck = set_truck
  end
  # POST /trucks
  # POST /trucks.json
  def create
    @user = current_user
    @truck = Truck.new({
      name: params['truck']['name'],
      location: params['truck']['location'],
      menu: params['truck']['menu'],
      hours: params['truck']['hours']
      })
    if @truck.save!
      flash[:notice] = "Truck saved successfully!"
      @user.trucks << @truck
      redirect_to user_trucks_path
    else
      flash[:error] = @truck.errors.full_messages.join(", ")
      redirect_to user_trucks_path(@user)
    end
  end
  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params_update)
        format.html { redirect_to user_trucks_url, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to user_trucks_path, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end
    # list param for create without require list
    def truck_params_create
      params.permit(:name, :user_id, :location, :menu, :hours, trucks_attributes: [:name, :user_id])
    end
    # list params for update with require list
    def truck_params_update
      params.require(:truck).permit(:name, :user_id, :location, :menu, :hours, trucks_attributes: [:id,  :_destroy])
    end
    def set_user
      @user = User.find(params[:user_id])
    end
end
