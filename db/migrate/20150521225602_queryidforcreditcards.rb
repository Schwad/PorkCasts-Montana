class Queryidforcreditcards < ActiveRecord::Migration
  def change
     add_column :credit_cards, :query_id, :integer
  end
end
