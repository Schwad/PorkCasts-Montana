class Queryidforchecks < ActiveRecord::Migration
  def change
     add_column :checks, :query_id, :integer
  end
end
