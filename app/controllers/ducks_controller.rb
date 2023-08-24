class DucksController < ApplicationController
  before_action :set_duck, only: %i[show edit update destroy]

  def index
    @ducks = Duck.all
  end

  def show() end

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

  def edit() end

  def update
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @duck.destroy
    redirect_to ducks_path, status: :see_other
  end

  private

  def duck_params
    params.require(:ducks).permit(:name, :description, :url, :price, :category)
  end

  def set_duck
    @duck = Duck.find(params[:id])
  end
end
