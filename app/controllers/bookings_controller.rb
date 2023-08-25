class BookingsController < ApplicationController
  before_action :set_duck, only: %i[index show create edit update destroy]

  def index
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
  end

  def create
    @booking = Booking.new(user_id: current_user.id, duck_id: params[:duck_id])
    if @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit() end

  def update
    @booking.update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_bookings_path(current_user), status: :see_other
  end

  private

  def set_duck
    @ducks = Duck.where(params['user_id'])
  end
end
