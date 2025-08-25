class BookingSerializer
  include JSONAPI::Serializer
  
  attributes :visitor_name, :email, :phone, :visit_date, :number_of_visitors,
             :total_amount, :status, :special_requirements
  
  belongs_to :activity
end