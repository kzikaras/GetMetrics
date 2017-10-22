class AddApplicationsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :applications, :integer
  end
end
