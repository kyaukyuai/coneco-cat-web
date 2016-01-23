class AddIndexToCat < ActiveRecord::Migration
  def change
    add_index :cats, :site_id, :unique => true
  end
end
