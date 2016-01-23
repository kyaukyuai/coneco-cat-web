class ChangeFavCountToCats < ActiveRecord::Migration
  def up
    change_column_default :cats, :fav_count, 0
  end

  def down
    change_column_default :cats, :fav_count, nil
  end
end
