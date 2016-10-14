class AddDepartmentToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :department, :text, array: true
  end
end
