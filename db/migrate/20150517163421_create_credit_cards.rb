class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.float :amount
      t.integer :fiscal_year
      t.datetime :billing_date
      t.string :department
      t.string :merchant

      t.timestamps null: false
    end
  end
end
