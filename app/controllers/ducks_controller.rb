class DucksController < ApplicationController
  before_action :set_duck, only: %i[show edit update destroy]

  def index
    @ducks = Duck.all
    if params[:query].present?
      @ducks = @ducks.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def map
    @users = User.all
    @markers = @users.map do |user|
      if user.latitude.present? && user.longitude.present?
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "marker")
      }
      end
    end.compact
  end

  def myducks
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
    @ducks = Duck.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.new
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user_id = current_user.id
    if @duck.save!
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
    redirect_to myducks_ducks_path, status: :see_other
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :url, :price, :category)
  end

  def set_duck
    @duck = Duck.find(params[:id])
  end
end
