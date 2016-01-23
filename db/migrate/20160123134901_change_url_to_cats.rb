class ChangeUrlToCats < ActiveRecord::Migration
  def up
    change_column :cats, :link_url, :binary
    change_column :cats, :image_url, :binary
    change_column :cats, :userpic_url, :binary
  end

  def down
    change_column :cats, :link_url, :string
    change_column :cats, :image_url, :string
    change_column :cats, :userpic_url, :string
  end
end
