class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.integer :hit_count
      t.timestamps null: false
    end
  end
end