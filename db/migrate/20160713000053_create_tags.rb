class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :programming_language
      t.string :position
      t.integer :domain
      t.integer :courses
      t.timestamps null: false
    end
  end
end
