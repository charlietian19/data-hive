class CreateProjectTags < ActiveRecord::Migration
  def change
    create_table :project_tags do |t|
      t.integer :tag_id
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
