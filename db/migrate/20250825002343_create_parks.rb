class CreateParks < ActiveRecord::Migration[8.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.decimal :entrance_fee_foreign
      t.decimal :entrance_fee_local
      t.string :description

      t.timestamps
    end
  end
end
