class ScientistsController < ApplicationController
  
  before_action :find_scientist, only: [:show, :edit, :destroy, :update]
  
  def index
    @scientists = Scientist.all
  end

  def show
  end

  def new
    @scientist = Scientist.new
  end

  def create
    @scientist = Scientist.new
    if !@scientist.valid?
      render :new
    else
      @scientist.save
      redirect_to scientist_path(@scientist)
    end
  end

  def edit
  end

  def update
    @scientist.update(scientist_params)
    if !@scientist.valid?
      render :edit
    else
      @scientist.save
      redirect_to scientist_path(@scientist)
    end
  end

  def destroy
    @scientist.destroy
    redirect_to scientists_path
  end

  private
  def scientist_params
    params.require(:scientist).permit(:name, :field_of_study)
  end

  def find_scientist
    @scientist = Scientist.find(params[:id])
  end
end
