class BookingsController < ApplicationController
  before_action :set_duck, only: %i[index show create edit update destroy]

  def index
    @user = current_user
    @bookings = Booking.where(user_id: current_user.id)
    # raise
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit() end

  def update
    @booking.update
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id)
  end

  def set_duck
    @ducks = Duck.where(params['user_id'])
  end

  def set_booking_user
    @booking_user = User.find()
  end
end
