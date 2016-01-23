class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :site_id
      t.string :name
      t.string :description
      t.binary :keyword
      t.string :link_url
      t.string :image_url
      t.integer :userid
      t.string :username
      t.string :userpic_url
      t.integer :fav_count
      t.integer :like_count
      t.integer :comment_count
      t.datetime :posted_at
      t.datetime :soft_destroyed_at

      t.timestamps null: false
    end

    add_index :cats, :soft_destroyed_at
  end
end
