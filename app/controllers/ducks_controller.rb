class DucksController < ApplicationController
  before_action :set_duck, only: %i[show create edit update destroy]

  def index
    @ducks = Duck.all
  end

  def show

  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @duck.update(duck_params)
  end

  def destroy
    @duck.destroy
    redirect_to ducks_path, status: :see_other
  end

  private

  def duck_params
    params.require(:ducks).permit(:name, :description, :price, :category, :height, :width, :depth)
  end

  def set_duck
    @duck = Find.duck(params[:id])
  end
end
