class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.string :visitor_name
      t.string :email
      t.string :phone
      t.date :visit_date
      t.integer :number_of_visitors
      t.integer :status
      t.references :activity, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
