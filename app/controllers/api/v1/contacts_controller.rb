class Api::V1::ContactsController < ApplicationController
  def create
    # For now, just return a success message
    # TODO: save the contact form data and send emails
    render json: { message: "Contact form submitted successfully" }, status: :created
  end
end
