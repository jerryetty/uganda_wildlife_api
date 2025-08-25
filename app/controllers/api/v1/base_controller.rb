# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  
  private
  
  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
  
  def unprocessable_entity(exception)
    render json: { errors: exception.record.errors }, status: :unprocessable_entity
  end
end

# app/controllers/api/v1/parks_controller.rb
class Api::V1::ParksController < Api::V1::BaseController
  before_action :set_park, only: [:show]
  
  def index
    @parks = Park.active.includes(:activities)
    render json: ParkSerializer.new(@parks, include: [:activities]).serializable_hash
  end
  
  def show
    render json: ParkSerializer.new(@park, include: [:activities, :accommodations]).serializable_hash
  end
  
  private
  
  def set_park
    @park = Park.find(params[:id])
  end
end

# app/controllers/api/v1/bookings_controller.rb
class Api::V1::BookingsController < Api::V1::BaseController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user if user_signed_in?
    
    if @booking.save
      BookingMailer.confirmation(@booking).deliver_later
      render json: BookingSerializer.new(@booking).serializable_hash, status: :created
    else
      render json: { errors: @booking.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
    render json: BookingSerializer.new(@booking).serializable_hash
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:activity_id, :visitor_name, :email, :phone, 
                                   :visit_date, :number_of_visitors, :special_requirements)
  end
end