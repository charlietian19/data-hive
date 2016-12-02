class AddGradYearPhoneNumToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :graduation_year, :integer
  end
end
