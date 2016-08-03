class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :category
      t.string :tag
    end
  end
end
