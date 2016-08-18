class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :year, :integer
    add_column :users, :major, :text, array: true
    add_column :users, :minor, :text, array: true
    add_column :users, :gpa, :integer
  end
end
