class AddCountToEventsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :count, :integer
  end
end
