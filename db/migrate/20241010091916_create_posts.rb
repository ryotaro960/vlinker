class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :movie_main, null: false
      t.string :movie_main_embedded, null: false
      t.string :movie_main_thumbnail, null: false
      t.string :movie_left
      t.string :movie_left_embedded
      t.string :movie_right
      t.string :movie_right_embedded
      t.string :talent_name, null: false
      t.string :talent_belongs
      t.string :talent_channel
      t.string :talent_x
      t.string :talent_hp
      t.string :message
      t.timestamps
    end
  end
end
