class CreateTalentTags < ActiveRecord::Migration[7.0]
  def change
    create_table :talent_tags do |t|
      t.string :talent_tag_name, null: false, unique: true
      t.timestamps
    end
  end
end
