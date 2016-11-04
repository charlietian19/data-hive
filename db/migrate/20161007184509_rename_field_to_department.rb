class RenameFieldToDepartment < ActiveRecord::Migration
  def change
  	remove_column :projects, :field
  end
end
