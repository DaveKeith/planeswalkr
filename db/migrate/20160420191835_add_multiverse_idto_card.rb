class AddMultiverseIdtoCard < ActiveRecord::Migration
  def change
  	add_column(:cards, :multiverse_id, :integer)
  end
end
