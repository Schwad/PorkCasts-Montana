class FireUpUserQueries < ActiveRecord::Migration
  def change
    create_table :user_queries do |t|
      t.references :user, index: true, foreign_key: true
      t.references :query, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
