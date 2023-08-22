class FavoritesController < ApplicationController
  before_action :set_duck, only: %i[show create edit update destroy]

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to favorite_path(@favorite)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @favorite.update()
  end

  def destroy
    @favorite.destroy
    redirect_to favorites_path, status: :see_other
  end

  private

  def set_duck
    @duck = Find.duck(params[:duck_id])
  end
end
