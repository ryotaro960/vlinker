class CreatePostMovieTags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_movie_tags do |t|
      t.references :post, foreign_key: true
      t.references :movie_tag, foreign_key: true
      t.timestamps
    end
  end
end
