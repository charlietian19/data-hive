class DropTagsTable < ActiveRecord::Migration
  def change
  	drop_table :project_tags
  	drop_table :tags
  end
end
