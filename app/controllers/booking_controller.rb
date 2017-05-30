class BookingController < ApplicationController

  include ApplicationHelper

  def index
    authorize
    @bookings = Booking.where(user_id: session[:user_id])
  end

  def new
    authorize
    @booking = Booking.new
  end

  def create
    authorize
    # puts params.inspect
    @booking = Booking.new(booking_params)
    if @booking.save then
      # puts "saved successfully"
      redirect_to '/booking'
    else
      # puts @booking.errors.full_messages
      render :new
    end
  end

  def destroy
    authorize
    if Booking.destroy(params[:id]) then
      render status:200, json:{
        message: "Deleted"
      }
    else
      render status:500, json:{
        message: "Internal Server Error! Try again later."
      }
    end
  end

  def check
    authorize
    # puts params.inspect;
    @booking = Booking.find_by(club_id: params[:club_id], day: params[:day], time_slot: params[:time_slot])
    # puts @booking.inspect
    if @booking then
      render status:500, json:{
        message: "Slot is already booked."
      }
    else
      render status:200, json:{
        message: "Slot is available."
      }
    end

  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :club_id, :day, :time_slot)
  end
end
