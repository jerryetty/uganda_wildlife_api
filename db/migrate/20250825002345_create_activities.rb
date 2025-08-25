class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.decimal :price_foreign
      t.decimal :price_local
      t.integer :duration_hours
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
