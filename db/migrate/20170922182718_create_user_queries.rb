class CreateUserQueries < ActiveRecord::Migration
  def change
    create_table :user_queries do |t|
      t.integer :user_id
      t.integer :query_id

      t.timestamps null: false
    end
  end
end
