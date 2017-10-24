class AddApplicationRelationshipToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference(:events, :application)
  end
end
