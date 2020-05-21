class MissionsController < ApplicationController
  
  before_action :find_mission, only: [:show, :edit, :destroy]
  def index
    @missions = Mission.all
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    if !@mission.valid?
      render :new
    else
      @mission.save
      redirect_to scientist_path(@mission.scientist_id)
    end
  end

  def edit
  end

  def update
    @mission.update(mission_params)
  end

  def destroy
    @mission.destroy
    redirect_to missions_path
  end

  private
  def find_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:name, :planet_id, :scientist_id)
  end
end
