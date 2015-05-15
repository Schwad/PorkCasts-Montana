class AddForeignKeyToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :user_id, :integer
  end
end
