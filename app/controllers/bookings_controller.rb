class BookingsController < ApplicationController
  before_action :set_duck, only: %i[show create edit update destroy]

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @booking.update()
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_duck
    @duck = Duck.find(params[:duck_id])
  end
end
