class CreateMovieTags < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_tags do |t|
      t.string :movie_tag_name, null: false, unique: true
      t.timestamps
    end
  end
end
