class ChangeDescriptionToCats < ActiveRecord::Migration
  def up
    change_column :cats, :description, :binary
  end

  def down
    change_column :cats, :description, :string
  end
end
