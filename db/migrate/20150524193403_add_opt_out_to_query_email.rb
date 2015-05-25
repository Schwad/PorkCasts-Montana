class AddOptOutToQueryEmail < ActiveRecord::Migration
  def change
    add_column :queries, :opt_out_email, :boolean, :default => false
  end
end
