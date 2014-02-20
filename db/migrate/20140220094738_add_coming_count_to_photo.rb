class AddComingCountToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :coming_count, :int, :null => false, :default => 0
  end
end
