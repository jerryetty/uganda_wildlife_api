class AddDescriptionToParks < ActiveRecord::Migration[8.0]
  def change
    add_column :parks, :description, :string
  end
end
