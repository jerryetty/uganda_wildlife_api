class BookingMailer < ApplicationMailer
  default from: 'bookings@ugandawildlifetours.com'
  
  def confirmation(booking)
    @booking = booking
    @activity = booking.activity
    @park = @activity.park
    
    mail(
      to: @booking.email,
      subject: "Booking Confirmation - #{@activity.name}"
    )
  end
end