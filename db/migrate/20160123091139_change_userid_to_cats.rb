class ChangeUseridToCats < ActiveRecord::Migration
  def up
    change_column :cats, :userid, :integer, :limit => 8
  end

  def down
    change_column :cats, :userid, :integer
  end
end
