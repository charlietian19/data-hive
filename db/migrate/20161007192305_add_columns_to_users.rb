class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :courses, :text, array: true
  	add_column :users, :compensation, :integer
  end
end
