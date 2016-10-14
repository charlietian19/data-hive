class AddColumnsToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :courses, :text, array: true
  end
end
