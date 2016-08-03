class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.date :startdate
      t.date :enddate
      t.date :app_deadline
      t.text :description
      t.integer :hours_per_week
      t.integer :compensation
      t.integer :education_level
      t.integer :state, default: 1
      t.integer :field
      t.text :positions, array: true
      t.timestamps null: false
    end
  end
end
