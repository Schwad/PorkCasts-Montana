class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.float :amount
      t.datetime :payment_date
      t.string :department
      t.string :payee
      t.string :payment_category
      t.integer :popularity

      t.timestamps null: false
    end
  end
end
