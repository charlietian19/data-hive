class AddDepartmentToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :department, :text, array: true
  end
end
