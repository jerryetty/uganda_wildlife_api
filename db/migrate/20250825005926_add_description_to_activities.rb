class AddDescriptionToActivities < ActiveRecord::Migration[8.0]
  def change
    add_column :activities, :description, :string
  end
end
