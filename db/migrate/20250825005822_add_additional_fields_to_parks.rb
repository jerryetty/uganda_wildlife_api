class AddAdditionalFieldsToParks < ActiveRecord::Migration[8.0]
  def change
    add_column :parks, :location, :string
    add_column :parks, :highlights, :string
    add_column :parks, :image_url, :string
  end
end
