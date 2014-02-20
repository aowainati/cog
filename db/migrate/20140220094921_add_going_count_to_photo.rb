class AddGoingCountToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :going_count, :int, :null => false, :default => 0
  end
end
