class AddTweetCheckToCardAndCheck < ActiveRecord::Migration
  def change
    add_column :checks, :tweeted, :boolean, default: false
    add_column :credit_cards, :tweeted, :boolean, default: false
  end
end
