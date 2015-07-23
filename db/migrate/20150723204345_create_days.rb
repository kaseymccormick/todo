class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
