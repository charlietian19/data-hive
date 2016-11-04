class AddPreferredNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :preferedname, :string
  end
end
